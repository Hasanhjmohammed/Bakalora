import 'package:bakalora/Widget/custom_buttom.dart';
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
child: Icon(Icons.book,size:50,),
    ),
),
             Expanded(
                 flex: 3,
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
                         CustomButtom(callback: ()=>null, value: Get.width, child: Text('تسجيل دخول'), background: Colors.orange),
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
    
      children: [Text('ليس لديك حساب؟'),Text('أنشأ واحدا')],

    ),))
            ],
          ),
        ),
      ),
    );
  }
}
