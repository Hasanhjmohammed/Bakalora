import 'package:flutter/material.dart';

AppBar CustomAppBar(String title) {
  return AppBar(
    title: Text('$title'),
    centerTitle: true,
    leading: Container(),
    elevation: 0,
    backgroundColor: Colors.transparent,
  );
}


