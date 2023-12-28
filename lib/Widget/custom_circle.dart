import 'package:bakalora/Screens/subject.dart';
import 'package:flutter/material.dart';

class CustomCircl extends StatelessWidget {
  double ?value;
  String ?title;
  String?path;
  VoidCallback ?callback;
   CustomCircl({
     @required this.callback,
     @required this.value,
     @required this.title,
     @required this.path
   });

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap:callback,
            child: CircleAvatar(
              radius: value!/5,
              child: CircleAvatar(
                radius:(value!/5)-5,
                backgroundImage: AssetImage('$path'),
              ),
              //  backgroundColor: Colors.orange,
            ),
          ),
        ),
        Text('$title',
          style: TextStyle(
          fontSize: value! * 0.05,
        ),
        ),
      ],
    );
  }
}
