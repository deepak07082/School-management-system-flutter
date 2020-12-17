import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:school_management/Screens/LoginPage.dart';

class SpleashScreen extends StatefulWidget {
  @override
  _SpleashScreenState createState() => _SpleashScreenState();
}

class _SpleashScreenState extends State<SpleashScreen> {
  @override
  @override
  void initState() {
    Firebase.initializeApp();

    Timer(Duration(seconds: 8), start);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.27,
            width: MediaQuery.of(context).size.width * 0.35,
            child: FlareActor(
              "assets/school spleash.flr",
              animation: "start",
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }

  start() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => MyHomePage(),
        ),
      );
    });
  }
}
