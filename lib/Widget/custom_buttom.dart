import 'package:flutter/material.dart';


class CustomButtom extends StatelessWidget {
  double ?value;
  Widget ?child;
  VoidCallback ?callback;
  Color ?background;
   CustomButtom({@ required this.callback,@required this.value,@required this.child,@required this.background});

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            side:const  BorderSide(
             color: Colors.orange,
                width: 2,
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
           backgroundColor:background,
            minimumSize: Size(value!/1.5, value!/7)
        ),
        onPressed: callback,
        child:child);
  }
}
