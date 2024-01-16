import 'dart:developer';
import 'dart:io';

import 'package:bakalora/Constant/approute.dart';
import 'package:bakalora/Controller/barcode.dart';
import 'package:bakalora/Screens/lessons.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

enum event {Flash,Camera_facing ,push }

class QRViewScreen extends StatefulWidget {
  const QRViewScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewScreen> {
//  Barcode? result;
  //QRViewController? controller;
  BarcodeScan barcodeScan = Get.put(BarcodeScan());
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      barcodeScan.controller!.pauseCamera();
    }
    barcodeScan.controller!.resumeCamera();
  }
  @override
  Widget build(BuildContext context) {
   // setState(() {
      if (barcodeScan.barcode != null)
        print(
            'Barcode Type: ${describeEnum(  barcodeScan.barcode!.format)}   Data: ${ barcodeScan.barcode!.code}');
    //});
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 100.0
        : 250.0;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        //backgroundColor: Colors.black38,
        leading: PopupMenuButton<event>(
          onSelected: (va) async{
            if (va == event.Flash)  await barcodeScan.controller?.toggleFlash();
             else if  (va==event.Camera_facing) await barcodeScan.controller?.flipCamera();
            else if  (va==event.push)  Get.toNamed(AppRoute.lessons);
          },
          itemBuilder: (_) => [
           const  PopupMenuItem(
              child: Text('Flash'),
              value: event.Flash,
              // onTap: ()=>Get.toNamed(AppRoute.lessons),
            ),
           const  PopupMenuItem(
              child: Text('Camera_facing'),
              value: event.Camera_facing,
            ),
            const  PopupMenuItem(
              child: Text('push'),
              value: event.push,
            ),
          ],
        ),
      ),
      body: Column(children: <Widget>[
        Expanded(
            flex: 4,
            child: GetBuilder<BarcodeScan>(
              builder: (cont) {
                return QRView(
                  key: qrKey,
                  onQRViewCreated: _onQRViewCreated,
                  overlay: QrScannerOverlayShape(
                      borderColor: Colors.orange,
                      borderRadius: 10,
                      borderLength: 40,
                      borderWidth: 10,
                      cutOutSize: scanArea,
                      overlayColor: Color.fromRGBO(0, 0, 0, 0.9)),
                  onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
                );
              }
            )),
        Expanded(
            flex: 1,
            child: Container())
      ]),
      bottomSheet: BottomSheet(
          onClosing: () => null,
          // color: Colors.orange.withOpacity(0.9),
          builder: (con) => ListTile(
            title: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'أدخل كلمة السر بحال تعطل الكميرا',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
            subtitle: Padding(
              padding:
              const EdgeInsets.only(bottom: 10, left: 10, right: 10),
              child: TextFormField(
                onChanged: (String va) {
                  print(va);
                },
                textAlign: TextAlign.left,
                cursorColor: Colors.orange,
                style: Theme.of(context).textTheme.labelMedium,
                decoration: InputDecoration(
                    hintText: 'Code_number',
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                      BorderSide(color: Colors.orange, width: 1),
                    ),
                    filled: true),
              ),
            ),
          )),
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
    barcodeScan.ChangController(controller);
    // setState(() {
    //   this.controller = controller;
    // });
    controller.scannedDataStream.listen((scanData) {
      barcodeScan.ChangResulte(scanData);
      // setState(() {
      //   result = scanData;
      // });
    });
  }
}
