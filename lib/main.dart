import 'package:flutter/material.dart';
import'package:travel/pages/home_screen.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yolo',
      debugShowCheckedModeBanner:false,
      theme: ThemeData(
        primaryColor:Colors.purple,
        accentColor:Color(0xFFF2D9F3) ,
        scaffoldBackgroundColor:Color(0xFFFBF3FB),
      ),
      home: HomeScreen(),
    );
  }
}

