import 'dart:async';

import 'package:bakalora/Constant/approute.dart';
import 'package:bakalora/Screens/branch.dart';
import 'package:bakalora/Widget/Custom_appBar.dart';
import 'package:bakalora/Widget/custom_circle.dart';
import 'package:bakalora/Widget/custom_drawer.dart';
import 'package:bakalora/Widget/logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:bakalora/Widget/custom_buttom.dart';
import 'package:get/get.dart';
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}
class _WelcomeScreenState extends State<WelcomeScreen> {
  Timer ?timer;
  @override
void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer!.cancel();
   // print('aa');
  }


  void initState() {
    // TODO: implement initState
    super.initState();
    print(timer);
   timer= Timer.periodic(Duration(seconds: 2), (timer) {
     print('r');
     Get.offAndToNamed(AppRoute.branch);
   //  Get.toNamed(AppRoute.branch);
   });
  }
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                flex: 3,
                child: logoWidget(width: 160,),
            ),
            Expanded(
                flex: 1,
                child: Text('بكلوريا',style: TextStyle(fontSize: 40,color: Colors.orange),),)
          ],
        ),
      ),
    );
  }
}
