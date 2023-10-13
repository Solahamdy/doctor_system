import 'package:doctor_system/components/my_text.dart';
import 'package:doctor_system/core/size_config.dart';
import 'package:doctor_system/screens/appointments.dart';
import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  String text ;
  double size ;
  var fun ;
   CustomButton({this.fun,required this.size,required this.text,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height:55,
      width: 140,
      decoration:  BoxDecoration(color:const Color(0xff37bcdb) ,
      borderRadius: BorderRadius.circular(8),),
      child: Center(
        child: MaterialButton(
            onPressed: fun,
            child: Center(child: MyText(text: text,size:size,isBold: false,color: Colors.white))),
      ),
    );
  }
}
