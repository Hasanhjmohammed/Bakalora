

import 'package:bakalora/Constant/Branch.dart';
import 'package:bakalora/Constant/approute.dart';
import 'package:bakalora/Screens/AboutApplication.dart';
import 'package:bakalora/Screens/Auth/create_acount.dart';
import 'package:bakalora/Screens/Auth/sing_in.dart';
import 'package:bakalora/Screens/branch.dart';
import 'package:bakalora/Screens/lessons.dart';
import 'package:bakalora/Screens/scan_prcode.dart';
import 'package:bakalora/Screens/setting.dart';
import 'package:bakalora/Screens/subject.dart';
import 'package:bakalora/Screens/text.dart';
import 'package:bakalora/Screens/unit.dart';
import 'package:bakalora/Screens/welcome.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>?Routes=[
  GetPage(name: AppRoute.singIn, page: ()=> SingIn(),),
  GetPage(name: AppRoute.welcom, page: ()=> WelcomeScreen(),),
  GetPage(name: AppRoute.createaccount, page: ()=> CreateAccount()),
  GetPage(name: AppRoute.branch, page: ()=>  BranchScreen() ),
  GetPage(name: AppRoute.lessons, page: ()=>  LessonScreen() ),
  GetPage(name: AppRoute.subject, page: ()=>  SubjectScreen()),
  GetPage(name: AppRoute.test, page: ()=>  TestScreen()),
  GetPage(name: AppRoute.unite, page: ()=>  UnitScreenapp()),
  GetPage(name: AppRoute.qrViewScreen, page: ()=>QRViewScreen()),
  GetPage(name: AppRoute.setting, page: ()=> Setting(),),
  GetPage(name: AppRoute.aboutapplication, page: ()=> AboutApplication(),),
];