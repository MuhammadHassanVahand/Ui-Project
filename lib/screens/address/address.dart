import 'package:flutter/material.dart';
import 'package:mini_ui_project/constan/appButton.dart';
import 'package:mini_ui_project/constan/appColors.dart';
import 'package:mini_ui_project/screens/addCard/addCard.dart';
import 'package:mini_ui_project/screens/address/addressWidget.dart';
import 'package:mini_ui_project/screens/address/customAddressTile.dart';
import 'package:mini_ui_project/widget/appLargeText.dart';
import 'package:mini_ui_project/widget/appSmallText.dart';

List<Map> address = [
  {"location": "Home", "address": "karachi highyway", "isSelected": false},
  {"location": "Office", "address": "Shara e Faisal ", "isSelected": false},
];

class AdressDetails extends StatefulWidget {
  final double delivery;
  final double subTotal;
  final double total;
  final Function() clearCart;
  const AdressDetails(
      {super.key,
      required this.delivery,
      required this.subTotal,
      required this.total,
      required this.clearCart});

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
            child: AddressTile(
          delivery: widget.delivery,
          subTotal: widget.subTotal,
          total: widget.total,
          clearCart: widget.clearCart,
        )),
      ),
    );
  }
}
