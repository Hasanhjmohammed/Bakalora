import 'package:flutter/material.dart';
class CustomTextButton extends StatelessWidget {
  String ?value;
  Color ?color;
  VoidCallback ?callback;
   CustomTextButton({
     @override this.value,
     @override this.color,
     @override this.callback,
   });

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed:callback, child: Text('$value',style: TextStyle(
      fontSize: 15,
      color: color
    ),));
  }
}
