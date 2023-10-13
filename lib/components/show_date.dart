import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTextWidget extends StatelessWidget {
  const DateTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('MMMM dd, yyyy').format(now);

    return Text(
      formattedDate,
      style: const TextStyle(fontSize: 25,color:Colors.black ),
    );
  }
}