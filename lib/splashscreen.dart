
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:noteswithdialoguebox/signuppage.dart';

import 'loginpage.dart';


class splash extends StatefulWidget {

  @override
  State<splash> createState() => splashState();
}

class splashState extends State<splash> {


  @override
  void initState() {
    Timer(Duration (seconds: 5), () {
      Navigator.push(context, MaterialPageRoute(
        builder: (BuildContext context) => signuppage(),
      ),
      );

    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black26,
        body: Center(child: Container (
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                 width: 50,
                  height: 50,
                  child: Icon(Icons.note_add_sharp, color: Colors.greenAccent, size: 50)),

              SizedBox(
                height: 50,
              ),
              Text ( 'Advance Notes App', style: TextStyle (fontSize: 30, color: Colors.white))
            ],
          ),
        ))


    );
  }
}
















