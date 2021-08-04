import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:school_management/Screens/SpleashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DD School',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SpleashScreen(),
    );
  }
}
