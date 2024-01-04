import 'package:bakalora/Screens/scan_prcode.dart';
import 'package:bakalora/Screens/text.dart';
import 'package:bakalora/Widget/Custom_appBar.dart';
import 'package:bakalora/Widget/custom_buttom.dart';
import 'package:bakalora/Widget/custom_drawer.dart';
import 'package:bakalora/Widget/unit_name.dart';
import 'package:flutter/material.dart';

class UnitScreenapp extends StatefulWidget {
  List <Map<String,dynamic>>?sub;
  UnitScreenapp( {@required this.sub});
  @override
  State<UnitScreenapp> createState() => _UnitScreenState();
}
class _UnitScreenState extends State<UnitScreenapp> {
  bool anim=false;
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
anim=true;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    print('gggggggg');
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
      endDrawer: CustomDrawer(),
      appBar: CustomAppBar(),
      body: Container(
        child:Padding(
          padding:  EdgeInsets.only(bottom: 30,top: 8,left: 8,right: 8),
          child: Card(
            child: ListView.builder(
              itemCount: widget.sub!.length,
              itemBuilder: (con, index) =>UnitNameapp(
                backgroundcolor :null,
                     color: Colors.orange,
                  wigth:width,
                 v:anim?0:width,
                index:index,
                callback: ()=>
                    showDialog(context: context, builder:(co)=> AlertDialog(
                  title: Text('امسح الكود الخاص ',textAlign: TextAlign.center,),
                  content: CustomButtom(
                    background: Colors.orange,
                    callback: (){
                      Navigator.of(co).pop();
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const QRViewScreen(),
                        ),
                      );
                    },
                    value: width/1.5, child: Icon(Icons.border_bottom),),
                 ),
                ),
                title: '${widget.sub![index]['title']}',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
