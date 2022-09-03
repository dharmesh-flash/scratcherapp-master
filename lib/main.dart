import 'package:flutter/material.dart';
import 'package:scratcherapp/Homepage.dart';
import 'package:scratcherapp/Introduction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: MyHomePage(),
      home: Introduction(),
    );
  }
}
