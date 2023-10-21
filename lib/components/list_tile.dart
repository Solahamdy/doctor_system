import 'package:flutter/material.dart';
import 'my_text.dart';
class ListTileExample extends StatelessWidget {// Required
  final String? title; // Optional
  final String? subtitle;
  bool completed;
  var func;

  ListTileExample(
      {super.key,
      this.title,
      this.subtitle,
      this.completed = false,
      this.func});

  bool enabled = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      enabled: completed,
      selected: false,
      title: MyText(
              text: title!,
              color: completed ? Colors.grey : Colors.black,
              isBold: true,
              size: 18,
            ),
      subtitle: Row(children: [
        const Icon(Icons.alarm,size: 25,color:Color(0xffc1c1c1)),
        const SizedBox(width: 10,),
        MyText(
          text: subtitle!,
          size: 18,
          color: Colors.grey,
          isBold: true,
        )
      ],),
      trailing: Transform.scale(
          scale: 1.4,
          child: IconButton(
              icon: Icon(
                completed
                    ? Icons.done_all
                    : Icons.close,
                color: completed
                    ? const Color(0xff18a7d1)
                    : Colors.red,
              ),
              onPressed: func)),
    );

  }
}
