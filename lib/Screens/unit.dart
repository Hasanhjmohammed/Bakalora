import 'package:bakalora/Screens/text.dart';
import 'package:bakalora/Widget/custom_buttom.dart';
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
      appBar: AppBar(),
      body: Container(
        child:Padding(
          padding:  EdgeInsets.all(5),
          child: Card(
            child: ListView.builder(
              itemCount: widget.sub!.length,
              itemBuilder: (con, index) =>UnitNameapp(
                backgroundcolor :null,
                     color: Colors.orange,
                  wigth:width,
                v:anim?0:width,
                index:index,
                callback: ()=>showDialog(context: context, builder:(co)=> AlertDialog(

                  title: Text('هل أنت مستعد للاختبار '),
                  content: Row(
                    children: [
                      CustomButtom(
                        background: Colors.orange,
                        callback: (){
                          Navigator.of(co).pop();
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (con)=>TestScreen(),),
                          );
                        },
                        value: width/2.5, child: Text('نعم'),),
                      SizedBox(width: width*0.09,),
                      CustomButtom(
                        background: Colors.orange,
                        callback: ()=>
                          Navigator.of(co).pop(),

                        value: width/2.5, child: Text('ليس الان'),
                      ),
                    ],
                   ),
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
