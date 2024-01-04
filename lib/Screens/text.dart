import 'dart:ffi';

import 'package:bakalora/Controller/right_question.dart';
import 'package:bakalora/Widget/container_text.dart';

import 'package:bakalora/Widget/custom_buttom.dart';
import 'package:bakalora/Widget/custom_info.dart';
import 'package:bakalora/Widget/unit_name.dart';
import 'package:flutter/material.dart';
import 'package:bakalora/Constant/questionlist.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TextScreenState();
}

class _TextScreenState extends State<TestScreen> {
  double height=Get.size.height;
  double width=Get.size.width;
  int ch = 100;
  int marker = 0;
  bool check = true;
  RightQuestion rightQuestion = Get.put(RightQuestion());
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: showExitPopup,
      child: Scaffold(
        //   appBar: AppBar(
        //   backgroundColor: Colors.white,
        //   title: Text('اختبار العلوم',style: TextStyle(color: Colors.black),),
        // ),
        body: GetBuilder<RightQuestion>(builder: (con) {
          final answers = Question[rightQuestion.questionNumber]['test'] as Map;
          return Column(
            children: [
              SizedBox(
                height: height * 0.05 ,
              ),
              Expanded(
                flex: 23,
                child: ContainerText(
                  value: '${Question[rightQuestion.questionNumber]['title']}',
                  width: width ,
                ),
              ),
              Spacer(),
              Expanded(
                flex: 35,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for (int i = 0; i < answers.length; i++)
                        UnitNameapp(
                            backgroundcolor: ch == i
                                ? rightQuestion.check
                                : rightQuestion.notcheck,
                            icon: ch == i
                                ? rightQuestion.iconcheck
                                : rightQuestion.iconnotcheck,
                            color: Colors.white,
                            wigth: width,
                            index: 1,
                            v: 0,
                            title: '${answers['${i + 1}']}',
                            callback: () {
                              if (check == false) {
                              } else {
                                for (int j = 0; j < answers.length; j++)
                                  if (i == j) {
                                    ch = j;
                                    rightQuestion.ChangColorCheck(Colors.orange,
                                        Icons.radio_button_checked_outlined);
                                  }
                              }
                              // else
                              //   {
                              //   }
                            }),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: CustomInfo(
                      callback: () => check == false
                          ? Get.bottomSheet(
                              BottomSheet(
                                enableDrag: false,
                                showDragHandle: false,
                                onClosing: () => null,
                                builder: (con) =>ContainerText(value:'حل السؤال', width: width)
                              ),
                            )
                          : null,
                      width: width * 0.27,
                      height: height * 0.07,
                    ),
                  ),
                  //   Icon(Icons.info_outline_rounded,size: 30,),
                  Expanded(
                    flex: 3,
                    child: CustomButtom(
                      background: Colors.black12,
                      callback: () {
                        if (check == true) {
                          if (answers['${ch + 1}'] ==
                              Question[rightQuestion.questionNumber]['right']) {
                            marker++;

                            rightQuestion.ChangColorCheck(
                                Colors.green, Icons.check_circle);
                          } else {
                            for (int i = 0; i < answers.length; i++) {
                              if (answers['${i + 1}'] ==
                                  Question[rightQuestion.questionNumber]
                                      ['right']) {
                                ch = i;
                                rightQuestion.Right();
                              }
                            }
                          }
                          print(ch);
                          check = false;
                        } else {
                          if (rightQuestion.questionNumber <
                              Question.length - 1) {
                            rightQuestion.Reset();
                            rightQuestion.QuestionNumber();
                          } else {
                            showDialog(
                              context: context,
                              builder: (c) => AlertDialog(
                                title: Text('$marker'),
                              ),
                            );
                          }
                          check = true;
                        }

                        //  rightQuestion.Reset();
                        // Navigator.of(context).push(MaterialPageRoute(
                        //   builder: (context) => const QRViewScreen(),
                        // ));
                      },
                      value: width,
                      child: InkWell(
                        child: Icon(
                          check == true ? Icons.check : Icons.arrow_back,
                          color: Colors.orange,
                          size: 50,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        }),
      ),
    );
  }

    Future<bool> showExitPopup() async {
      return await showDialog( //show confirm dialogue
        //the return value will be from "Yes" or "No" options
        context: context,
        builder: (context) => AlertDialog(
          title: Text('هل متأكد من الخروج ؟'),
       content: Row(
         children: [
           CustomButtom(
             background: Colors.orange,
             callback: (){
               Navigator.of(context).pop(true);
             },
             value: width/2.5, child: Text('نعم'),),
           SizedBox(width: width*0.09,),
           CustomButtom(
             background: Colors.orange,
             callback: ()=>
                 Navigator.of(context).pop(false),

             value: width/2.5, child: Text('ليس الان'),
           ),
         ],
       ),
        ),
      )??false; //if showDialouge had returned null, then return false
    }
}
