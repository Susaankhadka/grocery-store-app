import 'package:flutter/material.dart';
import 'package:practiceapps/loginpage.dart';
import 'package:practiceapps/myscreenpage.dart';
//import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Loginpage());
  }
}
