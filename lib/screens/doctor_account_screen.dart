import 'package:doctor_system/components/custom_button.dart';
import 'package:doctor_system/components/info_row.dart';
import 'package:doctor_system/components/my_text.dart';
import 'package:doctor_system/screens/appointments.dart';
import 'package:flutter/material.dart';

import '../core/size_config.dart';
class DoctorAccountScreen extends StatelessWidget {
  const DoctorAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
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
      title: const Text('My Account',
          style: TextStyle(fontSize: 30, color: Colors.white)),
    ),
     body:  Center(
       child: Column(crossAxisAlignment: CrossAxisAlignment.center,
         children: [
           const SizedBox(height:35),
           const CircleAvatar(backgroundImage: AssetImage('assets/doctor.png'),
             radius:60 ,),
           const SizedBox(height: 20,),
           MyText(size: 30, color: Colors.black, isBold: true, text: 'Maria loana leonte'),
           const SizedBox(height: 5,),
           MyText(size: 20, color: Colors.grey, isBold: false, text: 'Hcp Name'),
           const SizedBox(height: 60,),
           InfoRow(text: '07434697256', icon: Icons.phone_android,color: Colors.grey),
           const SizedBox(height: 5,),
           InfoRow(text: 'maria.leonte@gmail.com', icon: Icons.alternate_email,color: Colors.grey),
           const SizedBox(height: 5,),
           InfoRow(text: '49 Nerva Traian Street ,Bucharest', icon: Icons.shopping_bag,color: Colors.grey),
           const SizedBox(height: 80,),
            CustomButton(text: 'Back',size: 22,fun: (){
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const AppointmentsScreen()),
                      (route) => false);
            }),
         ],
       ),
     ),
      );
  }
}
