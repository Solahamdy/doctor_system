import 'package:flutter/material.dart';
class TextLoginRegisterField extends StatelessWidget{
  var icon ;
  String text ;
  var validator ;
  var controller ;
  var keyboardType;

  TextLoginRegisterField({this.keyboardType,this.icon, required this.text, this.validator,this.controller,super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: TextFormField(
        validator: validator,
        controller: controller,
        keyboardType: keyboardType,
        textDirection: TextDirection.ltr,
        style: const TextStyle(fontSize: 15),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: Colors.grey,)),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: Color(0xff18a7d1))),
          border:const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, )),
          errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5),
              borderSide:const BorderSide(color: Colors.red,) ),
          suffixIcon: Icon(icon , color: Colors.grey,),
          labelText: text,labelStyle: const TextStyle(color:Colors.grey )

        ),

      ),
    );
  }
}