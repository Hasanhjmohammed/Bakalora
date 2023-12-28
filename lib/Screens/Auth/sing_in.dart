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
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            //  crossAxisAlignment: CrossAxisAlignment.center,
            //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  child: Container(
                    child:   CustomCircl(

                      path: 'images/img_5.png',
                      value: Get.height/3, title: '',

                      callback:()=>null,
                    ),
                ),
              ),),
              Expanded(
                flex: 3,
                child: GetBuilder<Password>(
                    builder: (con) {
                    return Container(
                      child:Form(
                        child:  Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomTextField(
                                hintText:'اسم المستخدم',
                                inputtext:'kf',
                             hit: ()=>print('ffffffff'),
                            ),
                            Spacer(),
                            CustomTextField(
                                hintText:' كلمة المرور',
                                inputtext:'h',
                            hit:()=>password.ChangrPassword(),
                            ),
                            Spacer(),
                            CustomButtom(
                                callback: () => Navigator.of(context).push(MaterialPageRoute(builder: (_)=>WelcomeScreen())),
                                value: Get.width,
                                child: Text('تسجيل دخول'),
                                background: Colors.orange),
                          ],
                        ),
                      ),
                    );
                  }
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
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
                          callback: ()=>Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>CreateAccount())),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
