import 'package:doctor_system/components/custom_button.dart';
import 'package:doctor_system/components/info_row.dart';
import 'package:doctor_system/components/my_text.dart';
import 'package:doctor_system/core/size_config.dart';
import 'package:doctor_system/screens/appointments.dart';
import 'package:doctor_system/screens/doctor_account_screen.dart';
import 'package:flutter/material.dart';

import '../models/appointments_model.dart';
class PatientAccountScreen extends StatelessWidget {
  const PatientAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
        title: const Text('Patient Account',
            style: TextStyle(fontSize: 30, color: Colors.white)),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu,
                size: 40,
              ))
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20,),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 130,width: 130,
                decoration:  BoxDecoration(shape: BoxShape.circle,color: Colors.white,
                    border: Border.all(color: Colors.grey.shade300)),
                child: const Image(image:AssetImage('assets/patient.png'), ),
              ),
              const SizedBox(width: 20,),
              Column(
                children: [
                  MyText(size: 20, color: Colors.black,isBold: true, text: 'Salma Hamdy'),
                  const SizedBox(height: 5,),
                  CustomButton(text: 'Medical History',size: 16),
                ],
              )
          ],),
          const SizedBox(height: 40,),
          InfoRow(text: '10:50  11:50 ', icon: Icons.alarm,color: Colors.grey),
          const SizedBox(height: 5,),
          InfoRow(text: '07434697256', icon: Icons.phone_android,color:const Color(0xff18a7d1) ,),
          const SizedBox(height: 5,),
          InfoRow(text: '48 Traian Street , Building 51 ,\nApartment 02 ,Brasov ', icon: Icons.location_on_outlined,color: Colors.grey),
          const SizedBox(height: 5,),
          InfoRow(text: 'Medical tests are performed to\nverify the state of heath', icon: Icons.description,color: const Color(0xff18a7d1)),
           const SizedBox(height: 60),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomButton(size: 16, text: 'START PROCEDURES ',),
              CustomButton(size: 16, text: 'EDIT')
            ],),
          const SizedBox(height: 40),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomButton(size: 16, text: 'BACK',fun: (){
                Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)=>const DoctorAccountScreen()) , (route) => false);
              }),
              CustomButton(size: 15, text: 'PATIENT MISSING')
            ],)

        ],
      ),
    );
  }
}
