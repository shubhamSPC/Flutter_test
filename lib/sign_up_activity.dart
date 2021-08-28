import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proj/login_activity.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';

class sign_up_activity extends StatefulWidget {
  static int userid = 0;
  static String usertype = "";

  @override
  _sign_up_activityState createState() => _sign_up_activityState();
}

class _sign_up_activityState extends State<sign_up_activity> {
  var firstnameController = TextEditingController();
  var lastnameController = TextEditingController();
  var usernameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confpasswordController = TextEditingController();
  bool _isObscure = true;

  bool visible = false;

  loadProgress() {
    if (visible == true) {
      setState(() {
        visible = false;
      });
    } else {
      setState(() {
        visible = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SafeArea(
                child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SingleChildScrollView(
                            child: Container(
                                margin: EdgeInsets.all(5.0),
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(bottom: 20.0),
                                      child: Text(
                                        "Sign Up",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 32.0,
                                        ),
                                      ),
                                    ),
                                    TextFormField(
                                      controller: firstnameController,
                                      style: (TextStyle(color: Colors.black)),
                                      decoration: InputDecoration(
                                          fillColor: Colors.black,
                                          labelText: 'First Name',
                                          labelStyle: TextStyle(
                                              color: Colors.black
                                              //color: myFocusNode.hasFocus ? Colors.blue : Colors.black
                                              ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.black,
                                                width: 2.0),
                                            borderRadius:
                                                BorderRadius.circular(25.0),
                                          ),
                                          border: OutlineInputBorder(),
                                          suffixIcon: Icon(
                                              Icons.account_circle_outlined)),
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    TextFormField(
                                      controller: lastnameController,
                                      style: (TextStyle(color: Colors.black)),
                                      decoration: InputDecoration(
                                          fillColor: Colors.black,
                                          labelText: 'Last Name',
                                          labelStyle: TextStyle(
                                              color: Colors.black
                                              //color: myFocusNode.hasFocus ? Colors.blue : Colors.black
                                              ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.black,
                                                width: 2.0),
                                            borderRadius:
                                                BorderRadius.circular(25.0),
                                          ),
                                          border: OutlineInputBorder(),
                                          suffixIcon: Icon(
                                              Icons.account_circle_outlined)),
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    TextFormField(
                                      controller: usernameController,
                                      style: (TextStyle(color: Colors.black)),
                                      decoration: InputDecoration(
                                          fillColor: Colors.black,
                                          labelText: 'Username',
                                          labelStyle: TextStyle(
                                              color: Colors.black
                                              //color: myFocusNode.hasFocus ? Colors.blue : Colors.black
                                              ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.black,
                                                width: 2.0),
                                            borderRadius:
                                                BorderRadius.circular(25.0),
                                          ),
                                          border: OutlineInputBorder(),
                                          suffixIcon: Icon(
                                              Icons.account_circle_outlined)),
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    TextFormField(
                                      controller: emailController,
                                      style: (TextStyle(color: Colors.black)),
                                      decoration: InputDecoration(
                                          fillColor: Colors.black,
                                          labelText: 'Email',
                                          labelStyle: TextStyle(
                                              color: Colors.black
                                              //color: myFocusNode.hasFocus ? Colors.blue : Colors.black
                                              ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.black,
                                                width: 2.0),
                                            borderRadius:
                                                BorderRadius.circular(25.0),
                                          ),
                                          border: OutlineInputBorder(),
                                          suffixIcon: Icon(
                                              Icons.alternate_email_outlined)),
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    TextFormField(
                                        controller: passwordController,
                                        style: (TextStyle(color: Colors.black)),
                                        obscureText: _isObscure,
                                        decoration: InputDecoration(
                                            fillColor: Colors.black,
                                            border: OutlineInputBorder(),
                                            labelText: 'Password',
                                            labelStyle:
                                                TextStyle(color: Colors.black),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Colors.black,
                                                  width: 2.0),
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                            ),
                                            suffixIcon: IconButton(
                                                icon: Icon(_isObscure
                                                    ? Icons.visibility
                                                    : Icons.visibility_off),
                                                onPressed: () {
                                                  setState(() {
                                                    _isObscure = !_isObscure;
                                                  });
                                                }))),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    TextFormField(
                                        controller: confpasswordController,
                                        style: (TextStyle(color: Colors.black)),
                                        obscureText: _isObscure,
                                        decoration: InputDecoration(
                                            fillColor: Colors.black,
                                            border: OutlineInputBorder(),
                                            labelText: 'Confirm Password',
                                            labelStyle:
                                                TextStyle(color: Colors.black),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Colors.black,
                                                  width: 2.0),
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                            ),
                                            suffixIcon: IconButton(
                                                icon: Icon(_isObscure
                                                    ? Icons.visibility
                                                    : Icons.visibility_off),
                                                onPressed: () {
                                                  setState(() {
                                                    _isObscure = !_isObscure;
                                                  });
                                                }))),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Card(
                                        margin: EdgeInsets.only(top: 35.0),
                                        shadowColor: Colors.black54,
                                        clipBehavior: Clip.none,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        child: OutlinedButton.icon(
                                          onPressed: () {
                                            if (firstnameController
                                                .text.isNotEmpty) {
                                              if (lastnameController
                                                  .text.isNotEmpty) {
                                                if (usernameController
                                                    .text.isNotEmpty) {
                                                  if (emailController
                                                      .text.isNotEmpty) {
                                                    if (passwordController
                                                        .text.isNotEmpty) {
                                                      if (confpasswordController
                                                          .text.isNotEmpty) {
                                                        if (passwordController
                                                                .text ==
                                                            confpasswordController
                                                                .text) {
                                                          loadProgress();
                                                          UserSignUp(
                                                              context,
                                                              firstnameController
                                                                  .text
                                                                  .toString(),
                                                              lastnameController
                                                                  .text
                                                                  .toString(),
                                                              usernameController
                                                                  .text
                                                                  .toString(),
                                                              emailController
                                                                  .text
                                                                  .toString(),
                                                              passwordController
                                                                  .text
                                                                  .toString());
                                                        } else {
                                                          errorpopup(
                                                              "Password not matched!");
                                                        }
                                                      } else {
                                                        errorpopup(
                                                            "Confirm password Should not be Empty!");
                                                      }
                                                    } else {
                                                      errorpopup(
                                                          "Password Should not be Empty!");
                                                    }
                                                  } else {
                                                    errorpopup(
                                                        "Email Should not be Empty!");
                                                  }
                                                } else {
                                                  errorpopup(
                                                      "User name Should not be Empty!");
                                                }
                                              } else {
                                                errorpopup(
                                                    "Last name Should not be Empty!");
                                              }
                                            } else {
                                              errorpopup(
                                                  "First name Should not be Empty!");
                                            }
                                          },
                                          icon: Icon(Icons.login),
                                          label: Text("Sign Up"),
                                        )),
                                    Center(
                                      child: Visibility(
                                          maintainSize: true,
                                          maintainAnimation: true,
                                          maintainState: true,
                                          visible: visible,
                                          child: Container(
                                              margin: EdgeInsets.only(
                                                  top: 50, bottom: 30),
                                              child:
                                                  CircularProgressIndicator())),
                                    ),
                                  ],
                                )))
                      ]),
                ),
              ),
            ),
          ),
        ));
  }

  Future<void> UserSignUp(BuildContext context, String fname, String lname,
      String uname, String email, String pass) async {
    RootApp.prefs = await SharedPreferences.getInstance();
    RootApp.prefs.setString("FNAME", fname);
    RootApp.prefs.setString("LNAME", lname);
    RootApp.prefs.setString("UNAME", uname);
    RootApp.prefs.setString("EMAIL", email);
    RootApp.prefs.setString("PASS", pass);
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => login_activity(),
      ),
    );
  }

  void errorpopup(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("$message"),
          // content:
          // new Text("Have a conversation with this person"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Ok"),
              onPressed: () {
                Navigator.pop(
                  context,
                  CupertinoPageRoute(builder: (context) => sign_up_activity()),
                );
              },
            ),
          ],
        );
      },
    );
  }
}

