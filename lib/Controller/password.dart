import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Password extends GetxController {
  bool password=true;
  void ChangrPassword(){

    password=!password;
    update();
  }

}