
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
                radius:(value!/5)-(value!/5*0.05),
                backgroundImage: AssetImage('$path'),
              ),
            ),
          ),
        ),
        title==''?Container():Text('$title',
          style: TextStyle(
          fontSize: value! * 0.05,
        ),
        ),
      ],
    );
  }
}
