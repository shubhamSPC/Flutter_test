import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proj/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';

class login_activity extends StatefulWidget {
  static int userid = 0;
  static String usertype = "";

  @override
  _login_activityState createState() => _login_activityState();
}

class _login_activityState extends State<login_activity> {
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();

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
                                        "Login",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 32.0,
                                        ),
                                      ),
                                    ),
                                    TextFormField(
                                      controller: usernameController,
                                      style: (TextStyle(color: Colors.black)),
                                      decoration: InputDecoration(
                                          fillColor: Colors.black,
                                          labelText: 'Username or Email',
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
                                    Card(
                                        margin: EdgeInsets.only(top: 35.0),
                                        shadowColor: Colors.black54,
                                        clipBehavior: Clip.none,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        child: OutlinedButton.icon(
                                          onPressed: () async {
                                            if (usernameController
                                                .text.isNotEmpty) {
                                              if (passwordController
                                                  .text.isNotEmpty) {
                                                RootApp.prefs =
                                                    await SharedPreferences
                                                        .getInstance();

                                                if (RootApp.prefs != null) {
                                                  if (usernameController.text ==
                                                          RootApp.prefs
                                                              .getString(
                                                                  "UNAME") ||
                                                      usernameController.text ==
                                                          RootApp.prefs
                                                              .getString(
                                                                  "EMAIL")) {
                                                    if (passwordController
                                                            .text ==
                                                        RootApp.prefs.getString(
                                                            "PASS")) {
                                                      loadProgress();
                                                      UserLogin(
                                                          context,
                                                          usernameController
                                                              .text
                                                              .toString(),
                                                          passwordController
                                                              .text
                                                              .toString());
                                                    } else {
                                                      errorpopup(
                                                          "Invalide Password!");
                                                    }
                                                  } else {
                                                    errorpopup(
                                                        "Invalide User name or Email!");
                                                  }
                                                }
                                              } else {
                                                errorpopup(
                                                    "Password Should not be Empty!");
                                              }
                                            } else {
                                              errorpopup(
                                                  "User name Should not be Empty!");
                                            }
                                          },
                                          icon: Icon(Icons.login),
                                          label: Text("Login"),
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

  Future<void> UserLogin(
      BuildContext context, String uname, String pass) async {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => dashboard(),
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
                  CupertinoPageRoute(builder: (context) => login_activity()),
                );
              },
            ),
          ],
        );
      },
    );
  }
}

