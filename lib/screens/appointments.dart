import 'package:doctor_system/blocs/doctor_cubit/doctor_cubit.dart';
import 'package:doctor_system/components/list_tile.dart';
import 'package:doctor_system/components/show_date.dart';
import 'package:doctor_system/screens/doctor_account_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/appointments_column.dart';
import '../core/size_config.dart';

class AppointmentsScreen extends StatelessWidget {
  const AppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocConsumer<DoctorCubit, DoctorState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = DoctorCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xff18a7d1),
            leading: const Row(
              children: [
                SizedBox(
                  width: 4,
                ),
                Image(
                  image: AssetImage('assets/stethoscope.png'),
                  color: Colors.white,
                ),
              ],
            ),
            leadingWidth: 60,
            title: const Text('Appointments',
                style: TextStyle(fontSize: 30, color: Colors.white)),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const DoctorAccountScreen()),
                            (route) => false);
                  },
                  icon: const Icon(
                    Icons.menu,
                    size: 40,
                  ))
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20,),
                const DateTextWidget(),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height:SizeConfig.screenHeight! * 0.8,
                  width: SizeConfig.screenWidth,
                  decoration: const BoxDecoration(
                    color: Color(0xfff2f2f2),
                  ),
                  child: ListView.separated(
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(color: Colors.grey),
                    itemCount: cubit.appointments.length,
                    itemBuilder: (context, index) {
                      return ListTileExample(
                        title: cubit.appointments[index].patientName,
                        subtitle: cubit.appointments[index].time,
                        completed: cubit.appointments[index].completed,
                        func:(){ cubit.changeCompleted(index);},
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
