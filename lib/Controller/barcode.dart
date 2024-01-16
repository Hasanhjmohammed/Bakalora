

import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class BarcodeScan extends GetxController {
  Barcode ?barcode ;
  QRViewController? controller;
  ChangResulte(Barcode b){

    barcode=b;
    update();
  }
  ChangController( QRViewController con){

  controller=con;
    update();
  }
}