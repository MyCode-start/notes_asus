import 'package:flutter/material.dart';

import 'dbhelper.dart';
import 'loginpage.dart';


class signuppage extends StatefulWidget {

  @override
  State<signuppage> createState() => _signuppageState();
}

class _signuppageState extends State<signuppage> {


  var namecontroller = TextEditingController();
  var emailcontroller = TextEditingController();
  var mobilecontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var confirmpascontroller = TextEditingController();
  
  var name;
  var email;
  var mobile;
  var password;
  var confpass;
  var newtempone;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset : false,
          backgroundColor: Colors.black26,
          body: Center(
            child: Container(
              width: 300,
              child: Column (
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 60, bottom: 10),
                    child: Text ('Signup Page', style: TextStyle(fontSize: 30, color: Colors.white)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      style: TextStyle(color:Colors.white),
                      decoration: InputDecoration (
                        labelText: "Name",
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
                      controller: namecontroller,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      style: TextStyle(color:Colors.white),
                      decoration: InputDecoration (
                          labelText: "Email",
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
                      controller: emailcontroller,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      style: TextStyle(color:Colors.white),
                      decoration: InputDecoration (
                          labelText: "Mobile",
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
                      controller: mobilecontroller,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      style: TextStyle(color:Colors.white),
                      decoration: InputDecoration (
                          labelText: "Password",
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
                      controller: passwordcontroller,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      style: TextStyle(color:Colors.white),
                      controller: confirmpascontroller,
                      decoration: InputDecoration (
                          labelText: "Confirm password",
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
                      /*onChanged: (value) {
                        if (value == passwordcontroller.text.toString()) {

                        } else {

                        }
                      },*/

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      width: 150,
                      height: 50,
                      child: ElevatedButton(

                          style: ElevatedButton.styleFrom(
                            primary: Colors.greenAccent,
                          ),

                          onPressed: () async{

                        name = namecontroller.text.toString();
                        email = emailcontroller.text.toString();
                        mobile = mobilecontroller.text.toString();
                        password = passwordcontroller.text.toString();
                        confpass = confirmpascontroller.text.toString();

                        newtempone = await DBhelper().isemailexist (email);
                         if (newtempone== true) {
                           showDialog( context: context, builder: (BuildContext context) {
                             return AlertDialog(
                                 title: Text('## ERROR', style: TextStyle(color: Colors.red)),
                                 content: Text ('The user already exit'),
                                 actions: [
                                 TextButton(
                                 onPressed: () {

                                   Navigator.pop(context);
                                   setState(() {

                                   });
                             },
                             child: Text('Try Again'),
                             ),
                             ],
                             );

                           },
                           );
                         } else {

                           DBhelper().signupadddata(name, email, mobile, password);
                           Navigator.push(context, MaterialPageRoute (builder: (context) => logindetails()));
                         }

                      }, child: Text('Sign Up', style: TextStyle (fontSize: 25, color: Colors.black))
                      ),
                    ),
                  ),
                  Text ('Already a user?', style: TextStyle (fontSize: 15, color: Colors.white)),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      width: 150,
                      height: 50,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.greenAccent,
                          ),

                          onPressed: (){
                        Navigator.push(context, MaterialPageRoute (builder: (context) => logindetails()));

                      }, child: Text('Login', style: TextStyle (fontSize: 25, color: Colors.black))),
                    ),
                  )

                ],
              ),
            ),
          )



      ),
    );
  }
}
















