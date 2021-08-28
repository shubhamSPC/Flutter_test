// @dart=2.9
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_proj/sign_up_activity.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(RootApp());
}

class RootApp extends StatelessWidget {
  static SharedPreferences prefs;
  @override
  Widget build(BuildContext context) {
    getStringValuesSF();
    return MaterialApp(
      title: 'Test Application',
      home: MyApp(),
    );
  }

  Future<void> getStringValuesSF() async {
    prefs = await SharedPreferences.getInstance();

  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => sign_up_activity())));
  }

  @override
  Widget build(BuildContext context) {


    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return WillPopScope(
        onWillPop: () async => false,
        child: const Scaffold(
          backgroundColor: Color(0xdfffffff),
          body:Center(
            child: Text(
                "Splash Screen",
            style: TextStyle(
              color: Colors.black,
              fontSize: 32.0,
            ),),
          )
        ));
  }


}
