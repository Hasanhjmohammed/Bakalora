import 'package:bakalora/Constant/Unites.dart';
import 'package:bakalora/Constant/approute.dart';
import 'package:bakalora/Screens/text.dart';
import 'package:bakalora/Widget/Custom_appBar.dart';
import 'package:bakalora/Widget/custom_buttom.dart';
import 'package:bakalora/Widget/custom_drawer.dart';
import 'package:bakalora/Widget/scan_alertDialog.dart';
import 'package:bakalora/Widget/unit_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class LessonScreen extends StatefulWidget {
  const LessonScreen({super.key});

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  bool anim=false;
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        anim=true;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
      endDrawer: CustomDrawer(context),
      appBar: CustomAppBar('الدروس'),
      body: Container(
        child:Padding(
          padding:  EdgeInsets.only(bottom: 30,top: 8,left: 8,right: 8),
          child: Card(
            child: ListView.builder(
              itemCount: Unites_5.length,
              itemBuilder: (con, index) =>UnitNameapp(
                icon: Icons.add_box,
                backgroundcolor :null,
                color: Colors.orange,
                wigth:width,
                v:anim?0:width,
                index:index,
                callback: ()=>scandialog(context, width,'ابدا الدراسة ',AppRoute.test,Icons.timer),
                title: '${Unites_5[index]['title']}',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
