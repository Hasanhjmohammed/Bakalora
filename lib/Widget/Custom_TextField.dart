import 'package:bakalora/Controller/password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CustomTextField extends StatelessWidget {
  String ?hintText;
  String ?inputtext;
  VoidCallback ?hit;
  TextEditingController ?value=TextEditingController();
    String? Function(String?) vali;
   CustomTextField({@required this.hintText,
  @required this.inputtext,
     @required this.value,
     @required this.hit,
     required this.vali,
   }
  );

  @override
  Widget build(BuildContext context) {
    Password password = Get.find();
    return TextFormField(
      style: TextStyle(fontSize: 20),
      controller: value,
      validator: vali,
            obscureText:inputtext!='h'? false:password.password,
       // autofocus: false,
        decoration: InputDecoration(

          suffix:inputtext!='h'?null: IconButton(
            icon: Icon(password.password?Icons.remove_red_eye_outlined:Icons.visibility_off_outlined,
             // color: Colors.orange,
            ),
            onPressed: hit,
          ),
          hintText: '$hintText',
        ),

      );
  }
}
