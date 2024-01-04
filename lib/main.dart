
import 'package:bakalora/Screens/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Screens/Auth/sing_in.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: Locale('ar', 'AE'),
      fallbackLocale: Locale('ar', 'AE'),
     // locale: Get.,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
        ),
        iconTheme: IconThemeData(
          color: Colors.orange,
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.orange,
        ),
         primaryColorDark: Colors.orange,
         primarySwatch: Colors.orange,
       colorScheme: ColorScheme.dark(
           onSurface:Colors.orange,
         error: Colors.deepOrange,

           primary: Colors.orange

       ),
      ),
      title: 'Bakalora',
      // localizationsDelegates: const [
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      // ],
      // supportedLocales:  [
      // //  Locale('en','US'),
      //   Locale('ar','AE'),
      // ],
      home: TestScreen(),
    );
  }
}
