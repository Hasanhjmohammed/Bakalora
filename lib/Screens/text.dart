
import 'package:bakalora/Controller/right_question.dart';
import 'package:bakalora/Widget/container_text.dart';
import 'package:bakalora/Widget/custom_alertDialog.dart';
import 'package:bakalora/Widget/custom_buttom.dart';
import 'package:bakalora/Widget/custom_info.dart';
import 'package:bakalora/Widget/unit_name.dart';
import 'package:flutter/material.dart';
import 'package:bakalora/Constant/questionlist.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

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
          print ('kk');
          final answers = Question[rightQuestion.questionNumber]['test'] as Map;
          return Column(
            children: [
              SizedBox(
                height: height * 0.05 ,
              ),
              Expanded(
                flex: 23,
                child: Stack(
                  children: [
                    ContainerText(
                      value: '${Question[rightQuestion.questionNumber]['title']}',
                      width: width ,
                    ),
                    Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(' ${Question.length}  / ${rightQuestion.questionNumber+1}',
                            style: Theme.of(context).textTheme.labelSmall),
                        ),)
                  ],
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
                              if (check == true) {
                                for (int j = 0; j < answers.length; j++)
                                  if (i == j) {
                                    ch = j;
                                    rightQuestion.ChangColorCheck(Colors.orange,
                                        Icons.radio_button_checked_outlined);
                                  }
                              }
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
                          ? tryQuestion(width)
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
                    if(ch==100)// لم اختر اجابة بعد
                     {
                       chooseAneswer();
                     }
                   else // اخترت اجابة معينة
                     {
                       if (check == true) { // لاعطاء الزر وظيفة ثنائية (تصحيح و انتقال)
                         if (answers['${ch + 1}'] ==
                             Question[rightQuestion.questionNumber]['right']) // الاجابة المختارة هي الصحيحة
                         {
                           marker++; // زائد واحدة للنتيجة
                           rightQuestion.ChangColorCheck(
                               Colors.green, Icons.check_circle);// غير الوان الاجابة الصحيحة
                         }
                         else { // الاجابة المختارة خطأ
                           for (int i = 0; i < answers.length; i++) {
                             if (answers['${i + 1}'] ==
                                 Question[rightQuestion.questionNumber]
                                 ['right']) { // ابحث عن الاجابة الصحيحة
                               ch = i; // ضعها في مؤشر الاجابة الصحيحة
                               rightQuestion.Right(); // لون
                             }
                           }
                         }
                         print(ch);
                         check = false; // تفعيل الوظيفة الثنائية للزر
                       }
                       else { // الانتقال
                         if (rightQuestion.questionNumber <
                             Question.length - 1) { // تحقق من وجود اسئلة اخرى
                           rightQuestion.Reset(); // تصفير الالوان
                           rightQuestion.QuestionNumber(); // زيادة العداد
                           ch=100; // تصفير مؤشر الاجابة
                           check = true; // تفعيل الوظيفة الثانية للزر
                         }
                         else { // لا يوجد اسئلة
                           Results(context);
                         }
                       }
                     }
                        //  rightQuestion.Reset();
                        // Navigator.of(context).push(MaterialPageRoute(
                        //   builder: (context) => const QRViewScreen(),
                        // ),
                        // );
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

  Future<dynamic> tryQuestion(double width) {
    return Get.bottomSheet(
                            BottomSheet(
                              enableDrag: false,
                              showDragHandle: false,
                              onClosing: () => null,
                              builder: (con) =>ContainerText(value:'حل السؤال', width: width)
                            ),
                          );
  }
  SnackbarController chooseAneswer() {
    return Get.showSnackbar(const GetSnackBar(
                       duration:Duration(seconds: 1),
                         animationDuration: Duration(milliseconds: 500),
                         backgroundColor: Colors.orange,
                         snackPosition:SnackPosition.TOP,
                       messageText: Text('من فضلك اختر اجابة'), ),);
  }
  Future<dynamic> Results(BuildContext context) {
    return showDialog(
                           context: context,
                           builder: (c) {
                            double b=((marker*100/Question.length));
                            print((marker*100/Question.length)/100);
                             return  AlertDialog(
                               title: const ListTile(
                                 title: Text('النتيجة',textAlign: TextAlign.center,style:  TextStyle(
                                   color: Colors.orange,
                                   fontSize: 30,
                                   fontWeight: FontWeight.bold
                                 ),),
                                 subtitle: Text('الوحدة الاولى الدرس الاول ج 1',textAlign: TextAlign.center,),
                               ),
                               content: CircularPercentIndicator(
                                 animation:true,
                                 animationDuration: 1000,
                                 radius: 60.0,
                                 lineWidth: 9.0,
                                 percent: (marker*100/Question.length)/100,
                                 center: new Text("${b.toInt()}%"),
                                 progressColor: marker >Question.length-marker ?Colors.green:Colors.red,
                               ),
                               actions: [
                                 Row(mainAxisAlignment: MainAxisAlignment.center,
                                   children: [
                                     Text('  عدد الاسئلة الكلي  ',style: TextStyle(fontSize: 20),),
                                     Text('${Question.length}',style: TextStyle(fontSize: 20),),
                                   ],
                                 ),
                                 SizedBox(height: 50,),
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [
                                   Flexible(child: Text('الاسئلة الصحيحة'),),
                                     Text('$marker',style: TextStyle(fontWeight: FontWeight.bold)),
                                        SizedBox(width: 50,),
                                     Flexible(child: Text('الاسئلة الخاطئة'),),
                                     Text('${Question.length-marker}',style: TextStyle(fontWeight: FontWeight.bold)),
                                   ],
                                 ),
                                 //
                                 // Row(
                                 //   children: [
                                 //     Text('عدد الاسئلة الخاطئة'),
                                 //     Text('${Question.length-marker}'),
                                 //   ],
                                 // ),
                               ],
                             );
                           },
                         );
  }
  Future<bool> showExitPopup() async {
      return await
      BiuldDialog(context, 'هل أنت متأكد من خروج؟', () {
        ch=100;
        check=true;
        Navigator.of(context).pop(true);
        rightQuestion.ResetQuestionNumber();
        rightQuestion.Reset();
      }, () {
        Navigator.of(context).pop(false);
      }, width / 2.5, Text('نعم'), Text('ليس الان'),
      )??false; //if showDialouge had returned null, then return false
    }
}
