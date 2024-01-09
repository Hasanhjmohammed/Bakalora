import 'package:flutter/material.dart';


class logoWidget extends StatelessWidget {
  const logoWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 50,
          child: CircleAvatar(
            backgroundColor: Colors.orange,
            radius: 45,
            child: CircleAvatar(
              radius: 40,
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