import 'package:bakalora/Screens/Auth/sing_in.dart';
import 'package:bakalora/Widget/custom_buttom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
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
                flex: 2,
                child: Container(
                  child: Icon(Icons.book,size:50,),
                ),
              ),
              Expanded(
                flex: 4,
                child:  Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormField(
                        autofocus: false,
                        decoration: InputDecoration(
                            hintText: 'اسم المستخدم',
                            border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.orange)
                            ),
                            focusedBorder:    UnderlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2,
                                    color: Colors.orange)
                            ),
                            enabledBorder:  UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.orange)
                            ),
                            disabledBorder:  UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.orange)
                            )
                        ),
                      ),
                      TextFormField(
                        autofocus: false,
                        decoration: InputDecoration(
                          hintText: 'كلمة المرور',
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.orange)
                          ),
                          focusedBorder:    UnderlineInputBorder(
                            borderSide: BorderSide(
                                width: 2,
                                color: Colors.orange),
                          ),
                          enabledBorder:  UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.orange)
                          ),
                          disabledBorder:  UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange),
                          ),
                        ),
                      ),
                      TextFormField(
                        autofocus: false,
                        decoration: InputDecoration(
                          hintText: 'تأكيد كلمة المرور ',
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.orange)
                          ),
                          focusedBorder:    UnderlineInputBorder(
                            borderSide: BorderSide(
                                width: 2,
                                color: Colors.orange),
                          ),
                          enabledBorder:  UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.orange)
                          ),
                          disabledBorder:  UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange),
                          ),
                        ),
                      ),
                      CustomButtom(callback: ()=>null, value: Get.width, child: Text('إنشأ'), background: Colors.orange),
                    ],
                  ),
                ),
              ),
              Expanded(

                  flex: 1,
                  child: Container(

                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [GestureDetector(

                          onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (_)=>SingIn())),
                          child: Text('تمتلك حساب؟')),Text('سجل دخول')],

                    ),))
            ],
          ),
        ),
      ),
    );
  }
}
