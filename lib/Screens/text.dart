import 'package:bakalora/Screens/ec.dart';
import 'package:bakalora/Screens/scan_prcode.dart';
import 'package:bakalora/Widget/custom_buttom.dart';
import 'package:bakalora/Widget/unit_name.dart';
import 'package:flutter/material.dart';
import 'package:bakalora/Constant/questionlist.dart';
import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TextScreenState();
}

class _TextScreenState extends State<TestScreen> {

  Color r = Colors.white;
  IconData iconData=Icons.circle_outlined;
  Color r1 = Colors.white;
  IconData iconData1=Icons.circle_outlined;
  int  id=0;
  bool check =false;
   @override
  Widget build(BuildContext context) {

    final  answers = Question[id]['test'] as Map;
    // List<Map<String, Map<String, Object>>> Question = [
    //   {
    //     "id": {"1": '1'},
    //     "title": {'1': '"  5+5-5 ما نتيجة العملية الاتية",'},
    //     "test": {"1": "5", "2": "4"},
    //     "right": {'1': '5'},
    //   }
    // ];
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   title: Text('اختبار العلوم',style: TextStyle(color: Colors.black),),
      // ),
      body: Column(
        children: [
          SizedBox(height: height*0.05,),
          Expanded(
            flex: 23,
            child: Card(
             // elevation: 9,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.orange,width: 3),
                ),
                width: double.infinity,
                height: double.infinity,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Text('${Question[id]['title']}',
                        textAlign: TextAlign.center,
                        style:  TextStyle(
                       fontSize: width * 0.05
                      ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 35,
            child: Column(
              children: [
                for(int i=0;i<5;i++)
                UnitNameapp(
                    icon:
                   iconData,
                    color:r,
                    title: '${answers['1']}',
                    callback: () => check==true?null:
                      setState(() {
                        if(answers['1']== Question[id]['right'])
                        {  r = Colors.green;
                        iconData=Icons.check_circle;

                      //  r1 = Colors.white;
                      //  iconData1=Icons.circle_outlined;
                        }
                        else
                        {
                            r1 = Colors.green;
                            iconData1=Icons.check_circle;
                          r = Colors.red;
                          iconData=Icons.cancel;

                        }
                        check=true;
                      }),
                    wigth: width,
                    index: 1,
                    v: 0),
                // UnitNameapp(
                //     icon:
                //      iconData1,
                //     color: r1,
                //
                //     title: '${answers['2']}',
                //     callback: () =>check==true?null: setState(() {
                //       if( answers['2'] ==
                //           Question[id]['right'])
                //       {  r1 = Colors.green;
                //       iconData1=Icons.check_circle;
                //     //  r = Colors.red;
                //      // iconData=Icons.cancel;
                //       }
                //       else
                //       {
                //        r = Colors.green;
                //        iconData=Icons.check_circle;
                //         r1 = Colors.red;
                //         iconData1=Icons.cancel;
                //       }
                //       check=true;
                //     }),
                //     wigth: width,
                //     index: 1,
                //     v: 0),
                // UnitNameapp(
                //     icon:
                //     iconData1,
                //     color: r1,
                //
                //     title: '${answers['2']}',
                //     callback: () =>check==true?null: setState(() {
                //       if( answers['2'] ==
                //           Question[id]['right'])
                //       {  r1 = Colors.green;
                //       iconData1=Icons.check_circle;
                //         //  r = Colors.red;
                //         // iconData=Icons.cancel;
                //       }
                //       else
                //       {
                //         r = Colors.green;
                //         iconData=Icons.check_circle;
                //         r1 = Colors.red;
                //         iconData1=Icons.cancel;
                //       }
                //       check=true;
                //     }),
                //     wigth: width,
                //     index: 1,
                //     v: 0),
                // UnitNameapp(
                //     icon:
                //     iconData1,
                //     color: r1,
                //
                //     title: '${answers['2']}',
                //     callback: () =>check==true?null: setState(() {
                //       if( answers['2'] ==
                //           Question[id]['right'])
                //       {  r1 = Colors.green;
                //       iconData1=Icons.check_circle;
                //         //  r = Colors.red;
                //         // iconData=Icons.cancel;
                //       }
                //       else
                //       {
                //         r = Colors.green;
                //         iconData=Icons.check_circle;
                //         r1 = Colors.red;
                //         iconData1=Icons.cancel;
                //       }
                //       check=true;
                //     }),
                //     wigth: width,
                //     index: 1,
                //     v: 0),
                // UnitNameapp(
                //     icon:
                //     iconData1,
                //     color: r1,
                //
                //     title: '${answers['2']}',
                //     callback: () =>check==true?null: setState(() {
                //       if( answers['2'] ==
                //           Question[id]['right'])
                //       {  r1 = Colors.green;
                //       iconData1=Icons.check_circle;
                //         //  r = Colors.red;
                //         // iconData=Icons.cancel;
                //       }
                //       else
                //       {
                //         r = Colors.green;
                //         iconData=Icons.check_circle;
                //         r1 = Colors.red;
                //         iconData1=Icons.cancel;
                //       }
                //       check=true;
                //     }),
                //     wigth: width,
                //     index: 1,
                //     v: 0),
                //  UnitNameapp(title: 'title', callback: ()=>null, wigth: width, index: 1, v: 0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(

                          onTap: ()=>Get.bottomSheet(BottomSheet(
                              enableDrag: false,
                              showDragHandle: false,
                              onClosing: ()=>null, builder: (con)=>Container(

                              height: height/2,
                              child: Center(child: Text('حل السؤال '))))),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: Colors.orange
                            ),
                           // padding: EdgeInsets.all(10),
                       //   color: Colors.greenAccent,
                          width:width*0.27,
                          height: height*0.07,

                          child: Icon(Icons.info_outline_rounded,color: Colors.white,),
                  ),
                        ),
                      ),
                    ),
                 //   Icon(Icons.info_outline_rounded,size: 30,),
                    Expanded(
                      flex: 3,
                      child: CustomButtom(
                          background :Colors.black12,
                          callback: () {
                            setState(() {
                              r = Colors.white;
                              iconData=Icons.circle_outlined;
                              r1 = Colors.white;
                              iconData1=Icons.circle_outlined;
                              if(id<Question.length-1)
                              {   id++;
                              print(id);
                              }
                              else
                                id=0;
                              check=false;

                            });

                          },
                          //     Navigator.of(context).push(MaterialPageRoute(
                          //   builder: (context) => const QRViewExample(),
                          // )),

                          value: width,
                          child: InkWell(

                              child: Icon(Icons.arrow_back,color: Colors.orange,size: 50,))),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
