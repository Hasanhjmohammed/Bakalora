import 'package:flutter/material.dart';
class ListTitleDrawer extends StatelessWidget {
  IconData ?myicon;
  String  ?title;

  VoidCallback ?callback;

  ListTitleDrawer({@required this.myicon,@required this.title,@required this.callback,});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        child: ListTile(
          leading:Icon(myicon,color: Colors.orange,),
          title: Text(title!),
        ),
      ),
    );
  }
}