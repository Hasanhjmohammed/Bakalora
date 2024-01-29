import 'dart:async';
import 'dart:io';
import 'package:bakalora/Widget/Custom_appBar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:bakalora/Widget/custom_drawer.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MapScreen extends StatefulWidget {


  double ?lat=Get.arguments[0];
  double ?lon=Get.arguments[1];
   MapScreen({
   super.key
   });
  @override
  State<MapScreen> createState() => _MapScreenState();
}
class _MapScreenState extends State<MapScreen> {
  late final connectivityResult =  (Connectivity().checkConnectivity());



@override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final location=Get.arguments as Map<String,double>;
    return Scaffold(
      endDrawer: CustomDrawer(context),
      appBar: CustomAppBar('الخريطة'),
      body:  FutureBuilder(
        future: Connectivity().checkConnectivity(),
        builder: (context,snp) {
          return snp.data==ConnectivityResult.none?Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 120,horizontal: 30),
              child: GestureDetector(
                onTap: ()=>setState(() {
                  Connectivity().checkConnectivity();
                }),
                child: Container(
                  width: double.infinity,
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                     // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                      Icon(Icons.wifi_off,size: 100,color: Colors.orange,),
                      Text('لايوجد التصال بالانترنت لعرض موقع ')
                    ],),
                  ),
                ),
              ),
            ),
          ):GoogleMap(
          markers: {
            Marker(
              icon: BitmapDescriptor.defaultMarkerWithHue(30),
              markerId: MarkerId('1'),
            position: LatLng(location['lat']!,location['lon']!),
            ),
          },
          initialCameraPosition: CameraPosition(
            tilt:0.8,
            zoom: 10.0,
            target: LatLng(location['lat']!,location['lon']!),
          ),
            );
        }
      ),
    );
  }
}
