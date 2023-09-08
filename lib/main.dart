import 'package:flutter/material.dart';
import 'package:mini_ui_project/get_started.dart';
import 'package:mini_ui_project/widget/home_slider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: GetStarted(),
    );
  }
}
