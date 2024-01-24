import 'package:flutter/material.dart';
import 'package:get/get.dart';
class FavoriteController extends GetxController {
  bool fav=false;
  void Fav(){
    fav=!fav;
    update();

  }



}