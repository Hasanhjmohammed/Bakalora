import 'package:bakalora/Constant/Unites.dart';
import 'package:bakalora/Widget/Custom_listTitle.dart';
import 'package:bakalora/Widget/custom_alertDialog.dart';
import 'package:bakalora/Widget/logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'package:url_launcher/url_launcher_string.dart';
CustomDrawer(BuildContext context) {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  return Drawer(
    child: Column(
      children: [
        Container(
          width: double.infinity,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(color: Colors.orange),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: logoWidget(),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        'حسن حج محمد',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // Container(height:250),
        Expanded(
          flex: 4,
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ExpansionTile(
                    tilePadding: const EdgeInsets.all(10),
                    title: const Text(
                      'أكوادك',
                      style:
                          TextStyle(fontWeight: FontWeight.w300, fontSize: 35),
                    ),
                    children: [
                      for (int i = 0; i < Unites_2.length; i++)
                        ListTitleDrawer(
                            myicon: Icons.add_box,
                            title: '${Unites_2[i]['title']}'),
                    ],
                  ),
                  ListTitleDrawer(
                      myicon: Icons.favorite_border, title: 'المفضلة'),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            child: Column(
              children: [
                const Divider(
                  thickness: 1,
                  color: Colors.orange,
                ),
                ListTitleDrawer(
                  myicon: Icons.settings,
                  title: 'الاعدادت',
                ),
                ListTitleDrawer(myicon: Icons.call, title: 'اتصل بنا',callback: ()=>UrlLauncher.launchUrl(
                    Uri.parse(("tel:0996807325"),
                    ),
                ),),

                ListTitleDrawer(
                    myicon: Icons.support, title: 'راسلنا',callback: ()=>UrlLauncher.launchUrl(Uri.parse(('sms:0996807325'),),),),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            child: Column(
              children: [
                const Divider(
                  thickness: 1,
                  color: Colors.orange,
                ),
                ListTitleDrawer(
                  myicon: Icons.login_sharp,
                  title: 'سجل خروجك',
                  callback: () =>
                      BiuldDialog(context, 'هل أنت متأكد من خروج؟', () {
                    Navigator.of(context).pop();
                  }, () {
                    Navigator.of(context).pop();
                  }, width / 2.5, Text('نعم'), Text('لا')),
                ),
                ListTitleDrawer(
                  myicon: Icons.no_accounts_sharp,
                  title: 'احذف حسابك',
                  callback: () =>
                      BiuldDialog(context , 'هل أنت متأكد من حذف حسابك ؟', () {
                    Navigator.of(context).pop();
                  }, () {
                    Navigator.of(context).pop();
                  }, width / 2.5, Text('نعم'), Text('لا'),),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
