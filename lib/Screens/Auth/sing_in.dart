import 'package:bakalora/Controller/password.dart';
import 'package:bakalora/Screens/Auth/create_acount.dart';
import 'package:bakalora/Screens/welcome.dart';
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
  Password password = Get.put(Password());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> globalKey=GlobalKey<FormState>();
    TextEditingController name=TextEditingController();
    TextEditingController pass=TextEditingController();
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
                      path: 'images/img_5.png',
                      value: Get.height/3, title: '',

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
                            Spacer(),
                            CustomButtom(
                                callback: () {
                                  if(globalKey.currentState!.validate())
                                    Navigator.of(context).push(
                                      MaterialPageRoute(builder: (_)=> WelcomeScreen(),),);
                                  else
                                    return null;
                                } ,
                                value: Get.width,
                                child: Text('تسجيل دخول'),
                                background: Colors.orange),
                            Spacer(),
                          ],
                        ),
                      ),
                    );
                  }
                ),
              ),
              // Expanded(
              //     flex: 1,
              //     child: Container(
              //       padding: EdgeInsets.all(10),
              //     //  child:
              //     ),
              // )
            ],
          ),
        ),
      ),
      bottomSheet: BottomSheet(onClosing: ()=>null,builder: (c)=>Container(child:Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [CustomTextButton(

          color: Colors.white,
          value: 'ليس لديك حساب ؟',
          callback: ()=>null,
        ),
          CustomTextButton(
            color: Colors.orange,
            value: 'أنشأ واحداً',
            callback: ()=>Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>CreateAccount(),),
            ),
          ),
        ],
      ),),)
    );
  }
}
