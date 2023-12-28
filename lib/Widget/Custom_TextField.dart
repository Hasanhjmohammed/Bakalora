import 'package:bakalora/Controller/password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CustomTextField extends StatelessWidget {
  String ?hintText;
  String ?inputtext;
  VoidCallback ?hit;

   CustomTextField({@override this.hintText,
  @override this.inputtext,
     @override this.hit

   }
  );

  @override
  Widget build(BuildContext context) {

    Password password = Get.find();
    return TextFormField(
            obscureText:inputtext!='h'? false:password.password,
      cursorColor: Colors.orange,
       // autofocus: false,
        decoration: InputDecoration(

         // labelText: 'ddddddddd',
          suffix:inputtext!='h'?null: IconButton(
            icon: Icon(Icons.remove_red_eye_outlined,color: Colors.orange,),
            onPressed: hit,
          ),
          hintText: '$hintText',
          border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.orange)
          ),
          focusedBorder:    UnderlineInputBorder(
            borderSide: BorderSide(
                width: 2,
                color: Colors.orange),
          ),
          enabledBorder:  UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.orange)
          ),
          disabledBorder:  UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.orange),
          ),
        ),
      );

  }
}
