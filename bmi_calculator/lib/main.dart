import 'package:bmi_calculator/common/app_theme.dart';
import 'package:bmi_calculator/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/home_controller.dart';

void main() {
  Get.put(HomeController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: HomeScreen()
    );
  }
}
