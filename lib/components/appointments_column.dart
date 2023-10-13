import 'package:flutter/material.dart';
class AppointmentsColumn extends StatelessWidget {
  String patientName;
  var time;
  AppointmentsColumn({required this.patientName,this.time,super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(patientName,style: const TextStyle(color: Color(0xff8e8e8e),fontSize: 20),),
           const SizedBox(height: 8,),
           Row(children: [
            const Icon(Icons.alarm,size: 25,color:Color(0xffc1c1c1)),
            const SizedBox(width: 10,),
            Text(time,style: const TextStyle(color: Color(0xffc1c1c1),fontSize: 20),),

          ],)
        ],
      ),
    );
  }
}
