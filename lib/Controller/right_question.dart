import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RightQuestion extends GetxController {
  int questionNumber=0;
  void QuestionNumber(){

    questionNumber++;
    update();
  }
  void ResetQuestionNumber(){

    questionNumber=0;;
    update();
  }

Color check=Colors.orange;
IconData iconcheck=Icons.radio_button_checked_outlined;
IconData iconnotcheck=Icons.circle_outlined;
Color notcheck=Colors.grey[800]!;
Color ?right;
Color ?ans1;
Color ?ans2;
Color ?ans3;
Color ?ans4;

void ChaneColor(Color color){
    right=color;
    update();
  }

void ChangColorCheck(Color color,IconData iconData){
    check=color;
    iconcheck=iconData;

    update();
}
void ChangColorNotCheck(Color color,IconData iconData){
    notcheck=color;
    iconnotcheck=iconData;
    update();
}
void Right(){
   check=Colors.green;
   iconcheck=Icons.check_circle;
    iconnotcheck=Icons.cancel;
   notcheck=Colors.red;
   update();

}
void Reset(){
    check=Colors.grey[800]!;
   iconcheck=Icons.circle_outlined;
   iconnotcheck=Icons.circle_outlined;
   notcheck=Colors.grey[800]!;
    update();
}
}