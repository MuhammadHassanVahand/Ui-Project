import 'package:flutter/material.dart';
import 'package:mini_ui_project/constan/appButton.dart';
import 'package:mini_ui_project/constan/appColors.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({super.key});

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppButton(
                backgroundColor: AppColors.black1,
                text: " Buy Now",
                textColor: AppColors.blue,
                width: MediaQuery.of(context).size.width * 0.49,
              ),
              SizedBox(
                width: 2,
              ),
              AppButton(
                text: " Buy Now",
                textColor: AppColors.black1,
                width: MediaQuery.of(context).size.width * 0.49,
              ),
            ],
          ),
        ],
      )),
    );
  }
}
