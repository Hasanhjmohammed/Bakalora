import 'package:flutter/material.dart';


class logoWidget extends StatelessWidget {
 double ?width;
 logoWidget({
   @required this.width
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: width,
          child: CircleAvatar(
            radius: width!<100?width!-5:width!-10,
            child: CircleAvatar(
              radius: width!<100?width!-10:width!-20,
              backgroundImage: AssetImage(
                'assest/images/img_5.png',
              ),
            ),
          ),
        ),
      ),
    );
  }
}