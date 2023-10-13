import 'package:doctor_system/components/my_text.dart';
import 'package:flutter/material.dart';
class InfoRow extends StatelessWidget {
  var icon ;
  String text ;
  Color color ;
   InfoRow({required this.color,required this.text,required this.icon,super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20),
      child: Row(
        children: [
          Icon(icon,size: 35,color: Colors.grey),
          const SizedBox(width: 20,),
          MyText(size: 20, color: color, isBold: false, text: text)
        ],
      ),
    );
  }
}
