import 'package:flutter/material.dart';
import 'package:mini_ui_project/constan/appColors.dart';
import 'package:mini_ui_project/screens/orders/orders.dart';
import 'package:mini_ui_project/widget/appLargeText.dart';

class MoreOptions extends StatelessWidget {
  const MoreOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("More Options"),
        iconTheme: IconThemeData(color: AppColors.black100),
        backgroundColor: AppColors.black1,
        titleTextStyle: TextStyle(color: AppColors.black100, fontSize: 20),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Orders(),
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  color: AppColors.yellow,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                    child: AppLargeText(text: "Orders", color: AppColors.blue)),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
