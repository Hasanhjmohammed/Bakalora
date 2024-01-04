
import 'package:bakalora/Screens/branch.dart';
import 'package:bakalora/Widget/Custom_appBar.dart';
import 'package:bakalora/Widget/custom_circle.dart';
import 'package:bakalora/Widget/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:bakalora/Widget/custom_buttom.dart';
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
     endDrawer: CustomDrawer(),
      appBar: CustomAppBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomCircl(
              path: 'images/img_5.png',
              value: height, title: '',
            callback:()=> Navigator.of(context).push(
                MaterialPageRoute(builder: (con)=>BranchScreen())),
            ),
            CustomButtom(
                background: Colors.orange,
                value:width,callback:()=>Navigator.of(context).push(
                MaterialPageRoute(builder: (con)=>BranchScreen())),
            child:Text('ابدأ')
            ),
          ],
        ),
      )
    );
  }
}
