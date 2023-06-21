import 'package:flutter/material.dart';
import 'package:noteswithdialoguebox/shownotes.dart';
import 'package:noteswithdialoguebox/signuppage.dart';

import 'dbhelper.dart';
import 'mainnotespage.dart';


class logindetails extends StatefulWidget {

  @override
  State<logindetails> createState() => _logindetailsState();
}

class _logindetailsState extends State<logindetails> {


  var loginpasswordcontroller = TextEditingController();
  var loginemailcontroller = TextEditingController();

  var loginemail;
  var loginpassword;
  var newtemp;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset : false,
          backgroundColor: Colors.black26,
          body:  Column (
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text ('Login Page', style: TextStyle(fontSize: 31, color: Colors.white)),

              Padding(
                padding: const EdgeInsets.only(top: 30.0, bottom: 10, left: 15, right: 15),
                child: TextField(
                  style: TextStyle(color:Colors.white),
                  decoration: InputDecoration (
                      labelText: "Enter Email",
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                      enabledBorder: OutlineInputBorder (
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            width: 1, color: Colors.white,
                          )
                      )
                  ),
                  controller: loginemailcontroller,

                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 30, left: 15, right: 15),
                child: TextField(
                  style: TextStyle(color:Colors.white),
                  decoration: InputDecoration (
                      labelText: "Enter Password",
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                      enabledBorder: OutlineInputBorder (
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            width: 1, color: Colors.white,
                          )
                      )
                  ),
                  controller: loginpasswordcontroller,

                ),
              ),


              SizedBox(

                width: 150,
                height: 50,
                child: ElevatedButton(

                    style: ElevatedButton.styleFrom(
                      primary: Colors.greenAccent,
                    ),

                    onPressed: () async {

                  loginemail = loginemailcontroller.text.toString();
                  loginpassword = loginpasswordcontroller.text.toString();

                  newtemp = await DBhelper().Authentication (loginemail, loginpassword);

                  if (newtemp == true) {

                    Navigator.push(context, MaterialPageRoute (builder: (context) => mainnotespage()));

                  } else {

                    showDialog( context: context, builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('## ERROR', style: TextStyle(color: Colors.red)),
                        content: Text ('Please sign up first'),
                        actions: [
                          TextButton(
                            onPressed: () {

                              Navigator.pushReplacement(context, MaterialPageRoute(
                                builder: (BuildContext context) => signuppage(),
                              ),
                              );

                            },
                            child: Text('Signup'),
                          ),
                        ],
                      );

                    },
                    );


                  }


                }, child: Text('Login', style: TextStyle (fontSize: 25, color: Colors.black))
                ),
              )

            ],
          )



      ),
    );
  }
}
















