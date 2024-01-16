import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CustomInfo extends StatelessWidget {
  VoidCallback ?callback;
  double ?height;
  double ?width;
   CustomInfo({
    @required this.callback,
     @ required this.width,
     @required this.height
   });

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: callback,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
       color: Colors.orange
          ),
          width:width,
          height: height,
          child:Icon(Icons.info_outline_rounded,
           color: Colors.white,
          ),
        ),
      ),
    );
  }
}
