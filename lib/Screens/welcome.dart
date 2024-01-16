import 'package:bakalora/Constant/approute.dart';
import 'package:bakalora/Screens/branch.dart';
import 'package:bakalora/Widget/Custom_appBar.dart';
import 'package:bakalora/Widget/custom_circle.dart';
import 'package:bakalora/Widget/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:bakalora/Widget/custom_buttom.dart';
import 'package:get/get.dart';
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}
class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
     endDrawer: CustomDrawer(context),
      appBar: CustomAppBar(''),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomCircl(
              path: 'assest/images/img_5.png',
              value: height, title: '',
            callback:()=>Get.toNamed(AppRoute.branch),
            ),
            CustomButtom(
             //   background: Colors.orange,
                value:width,callback:()=>Get.toNamed(AppRoute.branch),
             child:Text('إبدأ',style: TextStyle(color: Colors.white,fontSize: 30))
            ),
          ],
        ),
      ),
    );
  }
}
