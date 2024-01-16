
import 'package:bakalora/Constant/styletext.dart';
import 'package:bakalora/Screens/ec.dart';
import 'package:bakalora/custom_font.dart';
import 'package:bakalora/routes.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Screens/Auth/sing_in.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp( MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: Locale('ar', 'AE'),
      fallbackLocale: Locale('ar', 'AE'),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Marhey',
        textTheme:  TextTheme(
         // bodySmall: bodySmall(),
          labelSmall: labelSmall(),
            bodyMedium :bodyMedium(),
            labelMedium: labelMedium(),
         // headlineMedium:
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
         buttonTheme: const ButtonThemeData(
          buttonColor: Colors.orange,
        ),
          primaryColorDark: Colors.orange,
          // primarySwatch: Colors.orange,
          colorScheme: const ColorScheme.dark(
            primaryContainer: Colors.orange,
           onPrimaryContainer: Colors.orange,
           background: Colors.orange,
           onPrimary :Colors.white,
           onSecondary:Colors.orange,
           secondary:Colors.white,
           onSurface:Colors.orange,
           error: Colors.deepOrange,
           onError: Colors.red,
           primary: Colors.orange
       ),
      ),
      title: 'Bakalora',
      home: SingIn(),
      getPages: Routes,
    );
  }


}
