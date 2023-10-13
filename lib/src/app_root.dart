import 'package:doctor_system/screens/doctor_account_screen.dart';
import 'package:doctor_system/screens/appointments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/doctor_cubit/doctor_cubit.dart';
import '../screens/patient_account_screen.dart';
class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context)=> DoctorCubit())
      ],
      child: const MaterialApp(
         home: PatientAccountScreen(),
      ),
    ) ;
  }
}
