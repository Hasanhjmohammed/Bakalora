import 'package:flutter/material.dart';
import 'package:get/get.dart';


class RightQuestion extends GetxController {

  Color ?right;
  void ChaneColor(Color color){
    right=color;
    update();
  }

}