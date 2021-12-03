import 'package:flutter/material.dart';
import 'package:uitoux/screen/design1_screen.dart';
import 'package:uitoux/screen/design2_screen.dart';
import 'package:uitoux/screen/time_table_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      home: TimeTableScreen(),
    );
  }
}
