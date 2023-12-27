import 'package:bakalora/Constant/Branch.dart';
import 'package:bakalora/Constant/Unites.dart';
import 'package:bakalora/Screens/unit.dart';
import 'package:bakalora/Widget/custom_circle.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:flutter/material.dart';

class SubjectScreen extends StatefulWidget {
  List <Map<String,dynamic>>?sub;
   SubjectScreen({@override this.sub});

  @override
  State<SubjectScreen> createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
          child: Card(
            child: AnimationLimiter(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: widget.sub!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return AnimationConfiguration.staggeredGrid(
                      position: index,
                      duration: Duration(seconds: 1),
                      columnCount: widget.sub!.length,
                      child: FadeInAnimation(
                        child: CustomCircl(
                          path: widget.sub![index]['image'],
                          value: width / 1.2,
                          title: '${widget.sub![index]['title']}',
                          callback: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (con) => UnitScreenapp(sub: Brach_Sencess ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ),
      ),
    );
  }
}
