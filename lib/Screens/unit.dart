import 'package:bakalora/Constant/approute.dart';
import 'package:bakalora/Screens/lessons.dart';
import 'package:bakalora/Widget/Custom_appBar.dart';
import 'package:bakalora/Widget/custom_buttom.dart';
import 'package:bakalora/Widget/custom_drawer.dart';
import 'package:bakalora/Widget/scan_alertDialog.dart';
import 'package:bakalora/Widget/unit_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UnitScreenapp extends StatefulWidget {
  List<Map<String, dynamic>>? sub;
  UnitScreenapp({@required this.sub});
  @override
  State<UnitScreenapp> createState() => _UnitScreenState();
}

class _UnitScreenState extends State<UnitScreenapp> {
  bool anim = false;
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        anim = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print('gggggggg');
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      endDrawer: CustomDrawer(context),
      appBar: CustomAppBar('الوحدات'),
      body: Container(
        child: Padding(
          padding: EdgeInsets.only(bottom: 30, top: 8, left: 8, right: 8),
          child: Card(
            child: ListView.builder(
              itemCount: widget.sub!.length,
              itemBuilder: (con, index) => UnitNameapp(
                  title: '${widget.sub![index]['title']}',
                  icon: index % 2 == 0 ? Icons.lock : Icons.school,
                  backgroundcolor: null,
                  color: Colors.orange,
                  wigth: width,
                  v: anim ? 0 : width,
                  index: index,
                  callback: () => index % 2 == 0
                      ? scandialog(context, width,'امسح الكود',AppRoute.qrViewScreen,Icons.border_bottom)
                      : Get.toNamed(AppRoute.lessons)),
            ),
          ),
        ),
      ),
    );
  }


}
