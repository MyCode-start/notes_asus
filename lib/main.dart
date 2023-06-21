import 'package:flutter/material.dart';
import 'package:noteswithdialoguebox/signuppage.dart';
import 'package:noteswithdialoguebox/splashscreen.dart';

import 'mainnotespage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: splash(),
    );
  }
}
