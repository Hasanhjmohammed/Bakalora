import 'package:bakalora/Constant/Branch.dart';
import 'package:bakalora/Constant/approute.dart';
import 'package:bakalora/Widget/Custom_appBar.dart';
import 'package:bakalora/Widget/custom_circle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BranchScreen extends StatefulWidget {
  const BranchScreen({super.key});

  @override
  State<BranchScreen> createState() => _BranchScreenState();
}

class _BranchScreenState extends State<BranchScreen> {

  @override
  Widget build(BuildContext context) {

    double height=MediaQuery.of(context).size.height;
    return Scaffold(
   //  endDrawer: CustomDrawer(context),
      appBar: CustomAppBar(''),
      body: Center(
        child: Container(
          height: height/3,
          child: Card(
            margin: EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: CustomCircl(
                    path: 'assest/images/img.png',
                    value: height/2,title: 'أدبي',callback: ()=>  Get.toNamed(AppRoute.subject,arguments: Brach_Lib),
            ),
                ),
                Expanded(
                  flex: 1,
                  child: CustomCircl(
                    path: 'assest/images/img_1.png',
                    value:  height/2,
                    title: 'علمي',callback: (){
                    Get.toNamed(AppRoute.subject,arguments: Brach_Sencess);
                  }
                ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
