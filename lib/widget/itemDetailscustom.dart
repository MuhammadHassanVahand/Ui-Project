import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mini_ui_project/constan/appColors.dart';
import 'package:mini_ui_project/widget/appLargeText.dart';
import 'package:mini_ui_project/widget/appSmallText.dart';

class ItemDetails extends StatelessWidget {
  final String catchPhrase;
  final double price;
  final String details;
  final double? offer;
  const ItemDetails(
      {super.key,
      required this.catchPhrase,
      required this.price,
      required this.details,
      this.offer = 30.0});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: AppColors.black10),
            width: double.infinity,
            height: 410,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 200,
                    child: AppSmallText(
                      text: catchPhrase,
                      color: AppColors.black100,
                      size: 25,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          AppLargeText(
                            text: "Rs.${price - offer!}",
                            color: AppColors.blue,
                            size: 20,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            width: 90,
                            height: 25,
                            decoration: BoxDecoration(
                              color: AppColors.blue,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Center(
                                child: AppSmallText(text: "Rs. ${offer} OFF")),
                          ),
                        ],
                      ),
                      AppSmallText(
                        text: "Reg. Price ${price}",
                        color: AppColors.black45,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: AppColors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        color: AppColors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        color: AppColors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        color: AppColors.yellow,
                      ),
                      Icon(
                        Icons.star_half,
                        color: AppColors.yellow,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  AppSmallText(
                    text: "Details",
                    color: AppColors.black100,
                    size: 18,
                  ),
                  AppSmallText(color: AppColors.black45, text: details)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
