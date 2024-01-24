import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Password extends GetxController {
  bool password=true;
  String ?valuepass;
  void ChangrPassword(){

    password=!password;
    update();
  }
  void resetpass(){

    password =false;
    update();
  }




}