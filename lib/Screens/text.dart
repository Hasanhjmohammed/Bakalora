
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:bakalora/Widget/custom_alertDialog.dart';
import 'package:bakalora/Controller/right_question.dart';
import 'package:bakalora/Constant/questionlist.dart';
import 'package:bakalora/Widget/container_text.dart';
import 'package:bakalora/Widget/custom_buttom.dart';
import 'package:bakalora/Controller/favorite.dart';
import 'package:bakalora/Widget/custom_info.dart';
import 'package:bakalora/Widget/unit_name.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:vibration/vibration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestScreen extends StatefulWidget {

  TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TextScreenState();
}

class _TextScreenState extends State<TestScreen> {
  final player = AudioPlayer();
  static AudioCache paly=AudioCache();
  double height = Get.size.height;
  double width  = Get.size.width;
  int ch = 100;
  int marker = 0;
  bool check = true;

  @override
  Widget build(BuildContext context) {
    final FavoriteController favoriteController = Get.put(FavoriteController());
    final RightQuestion rightQuestion = Get.put(RightQuestion());
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: showExitPopup,
      child: Scaffold(
        body: GetBuilder<RightQuestion>(builder: (con) {
          final answers = Question[rightQuestion.questionNumber]['test'] as Map;
          return Column(
            children: [
              SizedBox(
                height: height * 0.05,
              ),
              Expanded(
                flex: 23,
                child: Stack(
                  children: [
                    ContainerText(
                      value:
                          '${Question[rightQuestion.questionNumber]['title']}',
                      width: width,
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                            ' ${Question.length}  / ${rightQuestion.questionNumber + 1}',
                            style: TextStyle(fontSize: 15)),
                      ),
                    ),
                    GetBuilder<FavoriteController>(builder: (context) {
                      return Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                            padding: const EdgeInsets.only(right: 3, bottom: 2),
                            child: IconButton(
                                onPressed: () => favoriteController.Fav(),
                                icon: Icon(
                                  opticalSize: 0.9,
                                  favoriteController.fav
                                      ? Icons.star
                                      : Icons.star_border,
                                  size: 35,
                                  color: Colors.yellow,
                                ))),
                      );
                    }),
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
                                    rightQuestion!.ChangColorCheck(
                                        Colors.orange,
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
                      callback: () => tryQuestion(width),
                      // check == false
                      //     ? tryQuestion(width)
                      //     : null

                      width: width * 0.27,
                      height: height * 0.07,
                    ),
                  ),
                  //   Icon(Icons.info_outline_rounded,size: 30,),
                  Expanded(
                      flex: 3,
                      child:
                      CustomButtom(
                        background: Colors.black12,
                        callback: () async{
                          if (ch == 100) // لم اختر اجابة بعد
                          {
                            chooseAneswer();
                          } else // اخترت اجابة معينة
                          {
                            if (check == true) {
                              // لاعطاء الزر وظيفة ثنائية (تصحيح و انتقال)
                              if (answers['${ch + 1}'] ==
                                  Question[rightQuestion.questionNumber]
                                      ['right']) // الاجابة المختارة هي الصحيحة
                              {
                             //   await player.play(UrlSource('https://www.storyblocks.com/audio/stock/feedback-correct-right-answer-hqn83raddkgjl8nn8.html?preview=1'));
                                paly.loadAsset('assest/music/right_click.mp3');
                                marker++; // زائد واحدة للنتيجة
                                rightQuestion.ChangColorCheck(
                                    Colors.green,
                                    Icons.check_circle); // غير الوان الاجابة الصحيحة
                              } else {
                                Vibration.vibrate(duration: 200);
                                // الاجابة المختارة خطأ
                                for (int i = 0; i < answers.length; i++) {
                                  if (answers['${i + 1}'] ==
                                      Question[rightQuestion.questionNumber]
                                          ['right']) {
                                    // ابحث عن الاجابة الصحيحة
                                    ch = i; // ضعها في مؤشر الاجابة الصحيحة
                                    rightQuestion.Right(); // لون
                                  }
                                }
                              }
                              print(ch);
                              check = false; // تفعيل الوظيفة الثنائية للزر
                            } else {
                              // الانتقال
                              if (rightQuestion.questionNumber <
                                  Question.length - 1) {
                                // تحقق من وجود اسئلة اخرى
                                rightQuestion.Reset(); // تصفير الالوان
                                rightQuestion.QuestionNumber(); // زيادة العداد
                                ch = 100; // تصفير مؤشر الاجابة
                                check = true; // تفعيل الوظيفة الثانية للزر
                              } else {
                                // لا يوجد اسئلة
                                Results(context);
                              }
                            }
                          }
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
          builder: (con) => ContainerText(value: 'حل السؤال', width: width)),
    );
  }

  SnackbarController chooseAneswer() {
    return Get.showSnackbar(
      const GetSnackBar(
        duration: Duration(seconds: 1),
        animationDuration: Duration(milliseconds: 500),
        backgroundColor: Colors.orange,
        snackPosition: SnackPosition.TOP,
        messageText: Text(
          'من فضلك اختر اجابة',
          style: TextStyle(fontSize: 15, color: Colors.white),
        ),
      ),
    );
  }

  Future<dynamic> Results(BuildContext context) {
    return showDialog(
      context: context,
      builder: (c) {
        double b = ((marker * 100 / Question.length));
        print((marker * 100 / Question.length) / 100);
        return AlertDialog(
          title: const ListTile(
            title: Text(
              'النتيجة',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.orange,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'الوحدة الاولى الدرس الاول ج 1',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          content: CircularPercentIndicator(
            animation: true,
            animationDuration: 1000,
            radius: 60.0,
            lineWidth: 9.0,
            percent: (marker * 100 / Question.length) / 100,
            center: Text("${b.toInt()}%"),
            progressColor:
                marker > Question.length - marker ? Colors.green : Colors.red,
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '  عدد الاسئلة الكلي  ',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  '${Question.length}',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            SizedBox(
              height: 70,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child:
                      Text('الاسئلة الصحيحة', style: TextStyle(fontSize: 15)),
                ),
                Text('$marker',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                SizedBox(
                  width: 50,
                ),
                Flexible(
                  child: Text('الاسئلة الخاطئة',
                      style: TextStyle(
                        fontSize: 15,
                      )),
                ),
                Text('${Question.length - marker}',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              ],
            ),
          ],
        );
      },
    );
  }

  Future<bool> showExitPopup() async {
    final RightQuestion rightQuestion = Get.find();
    return await BiuldDialog(
          context,
          'هل أنت متأكد من خروج؟',
          () {
            ch = 100;
            check = true;
            Get.back(result: true);
            Navigator.of(context).pop(true);
            rightQuestion.ResetQuestionNumber();
            rightQuestion.Reset();
            marker = 0;
          },
          () {
            Get.back(result: false);
            //  Navigator.of(context).pop(false);
          },
          width / 2.5,
          Text('نعم'),
          Text('ليس الان'),
        ) ??
        false; //if showDialouge had returned null, then return false
  }

}
