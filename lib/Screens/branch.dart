import 'package:bakalora/Constant/Branch.dart';
import 'package:bakalora/Screens/subject.dart';
import 'package:bakalora/Widget/custom_circle.dart';
import 'package:flutter/material.dart';

class BranchScreen extends StatefulWidget {
  const BranchScreen({super.key});

  @override
  State<BranchScreen> createState() => _BranchScreenState();
}

class _BranchScreenState extends State<BranchScreen> {


  @override
  Widget build(BuildContext context) {

    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      //  title:Text('محمد سيد الكونين'),
      ),
      body: Center(
        child: Container(
          height: height/3,
          child: Card(
            margin: EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: CustomCircl(
                    path: 'images/img.png',
                    value: width,title: 'أدبي',callback: ()=>Navigator.of(context).push(
                      MaterialPageRoute(builder: (con)=>SubjectScreen(sub:Brach_Lib))),),
                ),
                Expanded(
                  flex: 1,
                  child: CustomCircl(
                    path: 'images/img_1.png',
                    value: width,
                    title: 'علمي',callback: ()=>Navigator.of(context).push(
                      MaterialPageRoute(builder: (con)=>SubjectScreen(sub: Brach_Sencess,))),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
