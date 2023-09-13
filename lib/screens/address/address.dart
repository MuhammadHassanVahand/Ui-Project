import 'package:flutter/material.dart';
import 'package:mini_ui_project/constan/appButton.dart';
import 'package:mini_ui_project/constan/appColors.dart';
import 'package:mini_ui_project/screens/address/addressWidget.dart';
import 'package:mini_ui_project/screens/address/customAddressTile.dart';
import 'package:mini_ui_project/widget/appLargeText.dart';
import 'package:mini_ui_project/widget/appSmallText.dart';

List<Map> address = [
  {"location": "Home", "address": "karachi highyway", "isSelected": false},
  {"location": "Office", "address": "Defance area", "isSelected": false},
];

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
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 50),
                    child: AppSmallText(
                      text: "Delivery Address",
                      color: AppColors.black100,
                      size: 25,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  AddressTile(),
                  SizedBox(
                    height: 10,
                  ),
                  AddAddress(),
                ],
              ),
              SizedBox(height: 230),
              Center(
                child: AppButton(
                  textColor: AppColors.black1,
                  text: "Add Card",
                  width: MediaQuery.of(context).size.width * 0.9,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
