import 'package:flutter/material.dart';

class UnitNameapp extends StatelessWidget {

  VoidCallback ?callback;
  String ?title;
  double ?wigth;
  int ?index;
  double? v;
  IconData ?icon;
  Color ?color ;
  Color ?backgroundcolor ;

   UnitNameapp({
     @required this.title,
     @required this.callback,
     @required this.wigth,
     @required this.index,
     @required this.v,
     @required this.icon,
     @required this.color,
     @required this.backgroundcolor,

   });
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: callback,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Card(
          child: AnimatedContainer(
            curve: Curves.easeInOut,
            duration: Duration(milliseconds: 200+ (index! * 200)),
            transform: Matrix4.translationValues(v!, 0, 0),
            decoration: BoxDecoration(
              //  color: Colors.orange,
                border: Border.all(color:color!),
            ),
            child: ListTile(
              tileColor: backgroundcolor,
              leading:Icon(
                icon,
                color: Colors.white,
              ),
              title: Text('$title'),
            ),
          ),
        ),
      ),
    );
  }
}
