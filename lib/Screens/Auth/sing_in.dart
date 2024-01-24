import 'package:bakalora/Constant/approute.dart';
import 'package:bakalora/Controller/password.dart';
import 'package:bakalora/Widget/Custom_TextField.dart';
import 'package:bakalora/Widget/Custom_textbutton.dart';
import 'package:bakalora/Widget/custom_buttom.dart';
import 'package:bakalora/Widget/custom_circle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingIn extends StatefulWidget {
  SingIn({super.key});

  @override
  State<SingIn> createState() => _SingInState();
}

class _SingInState extends State<SingIn> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  GlobalKey<FormState> globalKey=GlobalKey<FormState>();
  Password password = Get.put(Password());
  TextEditingController name=TextEditingController();
  TextEditingController pass=TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            //  crossAxisAlignment: CrossAxisAlignment.center,
            //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  child: Container(
                    child:   CustomCircl(
                      path: 'assest/images/img_5.png',
                      value: Get.height/3.5, title: '',

                      callback:()=>null,
                    ),
                ),
              ),
              ),
              Expanded(
                flex: 5,
                child: GetBuilder<Password>(
                    builder: (con) {
                    return Container(
                      child:Form(
                        key: globalKey,
                        child:  Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Spacer(),
                            CustomTextField(
                              value:name,
                              vali: (String? text) {
                                print(text);
                                if (text!.isEmpty) {
                                  return 'اسم المستخدم لا يمكن أن يكون فارغ';
                                } else
                                  return null;
                              },
                                hintText:'اسم المستخدم',
                                inputtext:'kf',
                             hit: ()=>print('ffffffff'),
                            ),
                           // Spacer(),
                            CustomTextField(
                              value: pass,
                              vali: (String? text) {
                                print(text);
                                if (text!.isEmpty) {
                                  return 'ادخل كلمة المروور';
                                } else
                                  return null;
                              },
                                hintText:' كلمة المرور',
                                inputtext:'h',
                            hit:()=>password.ChangrPassword(),
                            ),
                            // Spacer(),
                            // CustomButtom(
                            //     callback: () {
                            //       if(globalKey.currentState!.validate())
                            //         Navigator.of(context).push(
                            //           MaterialPageRoute(builder: (_)=> WelcomeScreen(),),);
                            //       else
                            //         return null;
                            //     } ,
                            //     value: Get.width,
                            //     child: Text('تسجيل الدخول',style: TextStyle(
                            //         fontSize: 25,
                            //         color: Colors.white,fontWeight: FontWeight.w200),),
                            //     background: Colors.orange),
                            Spacer(),
                          ],
                        ),
                      ),
                    );
                  }
                ),
              ),
              BottomSheet(
                onClosing: () => null,
                builder: (co) => Column(
                  children: [
                    CustomButtom(
                      callback: () {
                        if (globalKey.currentState!.validate()) {
                          Get.toNamed(AppRoute.welcom);
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //     builder: (_) =>const  WelcomeScreen(),
                          //   ),
                          // );
                         } else
                           return null;
                      },
                      value:MediaQuery.of(context).size.width,
                      background: Colors.orange,
                      child:   Text('تسجيل دخول ',style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,fontWeight: FontWeight.w200),),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextButton(
                        color: Colors.white,
                        value: 'ليس لديك حساب ؟',
                        callback: ()=>null
                      ),
                        CustomTextButton(
                          color: Colors.orange,
                          value: 'أنشأ واحداً',
                          callback: ()=>Get.offNamed(AppRoute.createaccount),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
