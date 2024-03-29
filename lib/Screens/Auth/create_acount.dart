import 'package:bakalora/Constant/approute.dart';
import 'package:bakalora/Controller/password.dart';
import 'package:bakalora/Screens/Auth/sing_in.dart';
import 'package:bakalora/Screens/branch.dart';
import 'package:bakalora/Screens/welcome.dart';
import 'package:bakalora/Widget/Custom_TextField.dart';
import 'package:bakalora/Widget/custom_buttom.dart';
import 'package:bakalora/Widget/custom_circle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bakalora/Widget/Custom_textbutton.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController conficpass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  child: CustomCircl(
                    path: 'assest/images/img_5.png',
                    value: Get.height / 5.5,
                    title: '',
                    callback: () => null,
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  child: Form(
                    //  autovalidateMode: AutovalidateMode.always,
                    key: globalKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Spacer(),
                        CustomTextField(
                          value: name,
                          vali: (String? text) {
                            print(text);
                            if (text!.isEmpty) {
                              return 'اسم المستخدم لا يمكن أن يكون فارغ';
                            } else
                              return null;
                          },
                          hintText: 'اسم المستخدم',
                          inputtext: 'kf',
                          hit: () => print('dd'),
                        ),
                        Spacer(),
                        CustomTextField(
                          value: pass,
                          vali: (String? text) {
                            print(text);
                            if (text!.isEmpty) {
                              return 'كلمة المرور لا يمكن أن يكون فارغة';
                            } else
                              return null;
                          },
                          hintText: ' كلمة المرور',
                          inputtext: 'kf',
                          hit: () => print('ff'),
                        ),
                        Spacer(),
                        CustomTextField(
                          value: conficpass,
                          vali: (String? text) {
                            print(text);
                            if (text!.isEmpty) {
                              return 'من فضلك أكد كلمة المرور';
                            } else
                              return null;
                          },
                          hintText: 'تأكيد كلمة المرور',
                          inputtext: 'kf',
                          hit: () => print('fff'),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
              // Expanded(
              //     flex: 1,
              //     child: Container(
              //       padding: EdgeInsets.all(10),
              //       child:
              //     ),
              // ),
              BottomSheet(
                onClosing: () => null,
                builder: (co) => Column(
                  children: [
                    CustomButtom(
                        callback: () {
                          if (globalKey.currentState!.validate()) {
                         Get.toNamed(AppRoute.welcom);
                          } else
                            return null;
                        },
                        value: width,
                        background: Colors.orange,
                      child:   Text('إنشأ',style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,fontWeight: FontWeight.w200),),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextButton(
                            callback: () => null,
                            color: Colors.white,
                            value: ' لديك حساب ؟'),
                        CustomTextButton(
                            callback: ()=>Get.offNamed(AppRoute.singIn),
                                // Navigator.of(context)
                                // .pushReplacement(MaterialPageRoute(
                                //     builder: (_) => SingIn(),),),
                            color: Colors.orange,
                            value: 'سجل دخولك'),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
