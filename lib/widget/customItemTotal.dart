import 'package:flutter/material.dart';
import 'package:mini_ui_project/constan/appButton.dart';
import 'package:mini_ui_project/constan/appColors.dart';
import 'package:mini_ui_project/data/addToCart.dart';
import 'package:mini_ui_project/screens/addCard/addCard.dart';
import 'package:mini_ui_project/screens/address/address.dart';
import 'package:mini_ui_project/widget/appLargeText.dart';
import 'package:mini_ui_project/widget/appSmallText.dart';

class ItemTotalPrices extends StatefulWidget {
  final double delivery;
  final double subtotal;
  final double total;
  final VoidCallback onButtonPressed;
  final String buttonText;
  const ItemTotalPrices({
    super.key,
    required this.delivery,
    required this.subtotal,
    required this.total,
    required this.onButtonPressed,
    required this.buttonText,
  });

  @override
  State<ItemTotalPrices> createState() => _ItemTotalPricesState();
}

class _ItemTotalPricesState extends State<ItemTotalPrices> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: Container(
        width: double.infinity,
        height: 190,
        decoration: BoxDecoration(
          color: AppColors.black10,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppSmallText(
                    text: "Subtotal",
                    size: 15,
                    color: AppColors.black60,
                  ),
                  AppLargeText(
                    text: "Rs.${widget.subtotal}",
                    color: AppColors.black90,
                    size: 15,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppSmallText(
                    text: "Delivery",
                    size: 15,
                    color: AppColors.black60,
                  ),
                  AppLargeText(
                    text: "Rs.${widget.delivery}",
                    color: AppColors.black90,
                    size: 15,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppSmallText(
                    text: "Total",
                    size: 15,
                    color: AppColors.black60,
                  ),
                  AppLargeText(
                    text: "Rs.${widget.total}",
                    color: AppColors.black90,
                    size: 15,
                  )
                ],
              ),
            ),
            AppButton(
              textColor: AppColors.black1,
              text: widget.buttonText,
              width: MediaQuery.of(context).size.width * 0.8,
              onPressed: widget.onButtonPressed,
            )
          ],
        ),
      ),
    );
  }
}
