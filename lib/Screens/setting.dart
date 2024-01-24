import 'package:bakalora/Constant/approute.dart';
import 'package:bakalora/Constant/cities.dart';
import 'package:bakalora/Controller/password.dart';
import 'package:bakalora/Widget/Custom_appBar.dart';
import 'package:bakalora/Widget/Custom_listTitle.dart';
import 'package:bakalora/Widget/custom_alertDialog.dart';
import 'package:bakalora/Widget/custom_drawer.dart';
import 'package:bakalora/Widget/scan_alertDialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {


  @override
var n=[];
  String ?val;
  Map<String,dynamic> ?dropdownValue11 ;
  Map<String,dynamic> dropdownValue =  {'city':'حلب'};
  Map<String,dynamic> ?dropdownValueCon ;
  final Password password = Get.find();
  Widget build(BuildContext context) {


//   password.resetpass();
    return Scaffold(
      appBar: CustomAppBar('الاعدادت '),
      endDrawer: CustomDrawer(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTitleDrawer(title: 'الاسم الكامل ',),
           const  Align(
                alignment: Alignment.center,
                child: Text('حسن حج محمد  ')),
            Divider(),
           GetBuilder<Password>(
             builder: (conte) {
               return ListTile(title: Text('كلمة السر'),
               trailing: Column(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   InkWell(
                       child: Icon(Icons.edit),
                   onTap: ()=>showDialog(context: context, builder: (_)=>chang_password(),
                   ),
                   ),
                 // SizedBox(height: 50,),
                  Flexible(
                  child: IconButton(onPressed: ()=>password.ChangrPassword(),
                    icon:Icon(password.password?Icons.visibility_off_outlined:Icons.remove_red_eye_outlined),),
                ),
                 ],
               ),
                 subtitle: password.password? Text('0993307069'):Text('XXXXXXXXX'),
                // leading: Container(),
               );
             }
           ),
            Divider(),
            Text('اختر مكان اقامتك الحالية '),
         SizedBox(

           height: 20,
         ),
         Padding(
           padding: const EdgeInsets.all(20.0),
           child: DropdownButtonFormField(
             decoration: InputDecoration(
             border: OutlineInputBorder(
                 borderSide: BorderSide(color: Colors.orange)
               )
             ),

             value: dropdownValue['city'],
               items: Cities.map((e) => DropdownMenuItem(
                 onTap: (){

                   n=e['countryside'];
                   val=n[0];
                 },
               value: e['city'],
               child: Text('${e['city']}'),
             )).toList(),
             onChanged: (va){
           //    print(Cities.indexOf( va);
               setState(() {
                 dropdownValue['city']=va!;
               });
             },
     ),
         ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: DropdownButtonFormField(
                decoration: InputDecoration(

                   border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange)
                    )
                ),
                value: val,
                items:n.map((e) => DropdownMenuItem(
                 // onTap: ()=>dropdownValueCon=e['countryside'],
                  value: e,
                  child: Text('${e}'),
                )).toList(),
                onChanged: (va){
                  //    print(Cities.indexOf( va);
                  setState(() {
                  val=va.toString();
                  });
                },
              ),
            ),
        val!=null?ElevatedButton(onPressed: ()=>null, child: Text('تثبيت')):Container(),
          ],
        ),
      ),
    );
  }

  AlertDialog chang_password() {
    return AlertDialog(
                 title: Text('تعديل كلمة السر '),
                 content: TextFormField(
                   autofocus: true,
                  initialValue: '0993307069',
                decoration: InputDecoration(
                  hintText: 'تغير كلمة السر ',
                  filled: true,
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15)
                  )
                ),
                 ),
                 actions: [
                   ElevatedButton(onPressed: ()=>null, child: Text('موافق'),),
                   ElevatedButton(onPressed: ()=>null, child: Text('اغلاق'),),
                 ],
               );
  }
}
