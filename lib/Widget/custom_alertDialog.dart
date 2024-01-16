import 'package:bakalora/Widget/custom_buttom.dart';
import 'package:flutter/material.dart';
 Future BiuldDialog(BuildContext contextDialog,String title,VoidCallback callback1,VoidCallback callback2,double value,Widget child1,Widget child2){

  return showDialog(context: contextDialog, builder: (builder)=>AlertDialog(
    title: Text('$title',textAlign: TextAlign.center,),
    content: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomButtom(callback: callback1, value: value, child: child1, background: Colors.orange),
        //SizedBox(width: value*0.09,),
        CustomButtom(callback: callback2, value: value, child: child2, background: Colors.orange),
       ],
     ),
   ),
  );
}