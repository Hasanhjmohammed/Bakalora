import 'package:bakalora/Constant/cities.dart';
import 'package:bakalora/Constant/text_const.dart';
import 'package:bakalora/Widget/Custom_appBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
class AboutApplication extends StatefulWidget {
  const AboutApplication({super.key});
  @override
  State<AboutApplication> createState() => _AboutApplicationState();
}

class _AboutApplicationState extends State<AboutApplication> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('حول التطبيق '),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('$about_my ',style: TextStyle(fontSize: 15),),
          ),),
          Divider(),
          cus_listitle('فريق الدعم','0993307069'),
          cus_listitle('الفريق الدراسي','0993307069'),
          Divider(),
          Text('مراكز البيع', style: TextStyle(fontSize: 20),),
        Container(
          height: Get.height/3,
          child:  SingleChildScrollView(
           child: Padding(
             padding: EdgeInsets.all(10.0),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.stretch,
               children:  [
                 for(int i=0;i<location.length;i++)
                 Padding(
                   padding: EdgeInsets.all(8.0),
                   child: Text('${location[i]} ',style: TextStyle(fontSize: 20),),
                 ),
                 // Text('حلب ,نبل , شارع السوق , مكتبة هيفا '),
                 // Text('حلب ,نبل , شارع السوق , مكتبة هيفا '),
                 // Text('حلب ,نبل , شارع السوق , مكتبة هيفا '),
                 // Text('حلب ,نبل , شارع السوق , مكتبة هيفا '),
                 // Text('حلب ,نبل , شارع السوق , مكتبة هيفا '),
                 // Text('حلب ,نبل , شارع السوق , مكتبة هيفا '),
                 // Text('حلب ,نبل , شارع السوق , مكتبة هيفا '),
                 // Text('حلب ,نبل , شارع السوق , مكتبة هيفا '),
                 // Text('حلب ,نبل , شارع السوق , مكتبة هيفا '),
                 // Text('حلب ,نبل , شارع السوق , مكتبة هيفا '),
                 // Text('حلب ,نبل , شارع السوق , مكتبة هيفا '),
                 // Text('حلب ,نبل , شارع السوق , مكتبة هيفا '),
               ],
             ),
           ),
           ),
    ),
        ],
      ),
    );
  }

  ListTile cus_listitle(String t,String sut,) {
    return ListTile(
          title:   Text('$t'),
          subtitle:  Text('$sut'),
          trailing: IconButton(icon: Icon(Icons.call,color: Colors.orange,),onPressed: ()=>UrlLauncher.launchUrl(
            Uri.parse(
              ("tel:$sut"),
            ),
          ),),
        );
  }
}
