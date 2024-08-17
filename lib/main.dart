import 'package:flutter/material.dart';
import 'package:news_app/pages/homepage.dart';
import 'package:news_app/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: AppColors.primary,
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}
