import 'package:flutter/material.dart';
import 'package:app_task/ui/splash_screen.dart';

void main() => runApp(MyRootApp());

class MyRootApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Uda Tube',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SplashScreen(),
    );
  }
}