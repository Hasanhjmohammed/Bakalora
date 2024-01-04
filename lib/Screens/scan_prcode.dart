import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRViewScreen extends StatefulWidget {
  const QRViewScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewScreen> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
setState(() {
 if(result!=null) print( 'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}');
});
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
        MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    return Scaffold(

      body: Column(
        children: <Widget>[
          Expanded(flex: 3, child:   QRView(
            key: qrKey,
            onQRViewCreated: _onQRViewCreated,
            overlay: QrScannerOverlayShape(
                borderColor: Colors.orange,
                borderRadius: 10,
                borderLength: 40,
                borderWidth: 10,
                cutOutSize: scanArea,
              overlayColor: Color.fromRGBO(0, 0, 0, 0.9)

            ),
            onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
          )),
          Expanded(
            flex: 1,
            child: BottomSheet(

              onClosing: ()=>null,
             // color: Colors.orange.withOpacity(0.9),
             builder:(con)=> Column(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('أدخل كلمة السر بحال تعطل الكميرا',style: TextStyle(fontSize: 20),),
                SizedBox(height: Get.height*0.01,),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10,left: 10,right: 10),
                  child: TextFormField(
                    textAlign: TextAlign.left,
                      cursorColor:Colors.orange,
                    style: TextStyle(

                      fontSize: 20
                    ),
                    decoration: InputDecoration(

                      hintText: 'Code_number',
                      border:OutlineInputBorder() ,
                        focusedBorder: OutlineInputBorder(

                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(

                            color: Colors.orange ,
                            width: 2),
                        ),

                      filled: true
                    ),
                  ),
                ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }
  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }
}