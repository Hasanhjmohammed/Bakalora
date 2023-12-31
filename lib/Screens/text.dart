import 'package:bakalora/Controller/right_question.dart';

import 'package:bakalora/Widget/custom_buttom.dart';
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
int ch=100;

  Color r = Colors.white;
  IconData iconData=Icons.circle_outlined;
  Color r1 = Colors.white;
  IconData iconData1=Icons.circle_outlined;
  bool check =true;
  RightQuestion rightQuestion=Get.put(RightQuestion());



   @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   title: Text('اختبار العلوم',style: TextStyle(color: Colors.black),),
      // ),
      body: GetBuilder<RightQuestion>(
        builder: (con) {
          print(1);
          final  answers = Question[rightQuestion.questionNumber]['test'] as Map;
          return Column(
            children: [
              SizedBox(height: height*0.05,),
              Expanded(
                flex: 23,
                child: Card(
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
                          child: Text('${Question[rightQuestion.questionNumber]['title']}',
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
              Spacer(),
              Expanded(
                flex: 35,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for(int i=0;i<answers.length;i++)
                      UnitNameapp(
                          backgroundcolor:ch==i?rightQuestion.check:rightQuestion.notcheck,
                          icon:ch==i?rightQuestion.iconcheck:rightQuestion.iconnotcheck,
                          color:Colors.white,
                          wigth: width,
                          index: 1,
                          v: 0,
                          title: '${answers['${i+1}']}',
                          callback: () {
                            for(int j=0;j<answers.length;j++)
                              if(i==j)
                             {
                               ch=j;

                               rightQuestion.ChangColorCheck(Colors.orange,Icons.radio_button_checked_outlined);
                             }
                            else
                              {
                              }
                            //  check=true;
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

                         if(check==true)
                           {
                             print('llllllllll');
                             if(answers['${ch+1}']==Question[rightQuestion.questionNumber]['right'])
                           {
                             print('jjjjjjj');
                             rightQuestion.ChangColorCheck(Colors.green, Icons.check_circle);
                           }
                           else
                           {
                             print('aaaaa');
                             for(int i=0;i<answers.length;i++)
                             {
                               if(answers['${i+1}']==Question[rightQuestion.questionNumber]['right'])
                               {
                                 print('kkkkk');
                                 ch=i;
                                 rightQuestion.Right();
                               }
                             }
                           }
                           print(ch);
                           check=false;
                           }
                         else

                           {
                             if(rightQuestion.questionNumber<Question.length-1)
                             {
                               rightQuestion.Reset();
                               rightQuestion.QuestionNumber();}
                             else
                             {

                               showDialog(context: context, builder: (c)=>AlertDialog(
                                 title: Text('لقد وصلت الى النهاية'),
                               ),
                               );
                             }
                             check=true;
                           }

                        //  rightQuestion.Reset();
                          // Navigator.of(context).push(MaterialPageRoute(
                          //   builder: (context) => const QRViewScreen(),
                          // ));
                        },

                        value: width,
                        child: InkWell(

                            child: Icon(Icons.arrow_back,color: Colors.orange,size: 50,))),
                  ),
                ],
              ),
            ],
          );
        }
      ),
    );
  }

}
