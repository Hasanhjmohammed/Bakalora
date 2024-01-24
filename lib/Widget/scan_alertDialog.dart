import 'package:bakalora/Widget/custom_buttom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
Future<dynamic> scandialog(BuildContext context, double width,String title,String Route,IconData iconData) {
  return showDialog(
    context: context,
    builder: (co) => AlertDialog(
      title: Text(
        '$title ',
        textAlign: TextAlign.center,
      ),
      content: CustomButtom(
        background: Colors.orange,
        callback: () {
          Get.back();
          Get.toNamed(Route);
        },
        value: width / 1.5,
        child: Icon(iconData),
      ),
    ),
  );
}