import 'package:flutter/material.dart';
import 'package:test_app/view/home_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Test App',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.indigo[50],
        primarySwatch: Colors.indigo,
      ),
      home: HomeScreen(),
    );
  }
}
