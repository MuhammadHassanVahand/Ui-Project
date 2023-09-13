import 'package:flutter/material.dart';
import 'package:mini_ui_project/constan/appColors.dart';

class AdressDetails extends StatefulWidget {
  const AdressDetails({super.key});

  @override
  State<AdressDetails> createState() => _AdressDetailsState();
}

class _AdressDetailsState extends State<AdressDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Shpping beg"),
        iconTheme: IconThemeData(color: AppColors.black100),
        backgroundColor: AppColors.black1,
        titleTextStyle: TextStyle(color: AppColors.black100, fontSize: 20),
      ),
    ));
  }
}
