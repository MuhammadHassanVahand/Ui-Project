import 'package:flutter/material.dart';
import 'package:mini_ui_project/constan/appColors.dart';
import 'package:mini_ui_project/constan/appIcons.dart';
import 'package:mini_ui_project/widget/appLargeText.dart';
import 'package:mini_ui_project/widget/appSmallText.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 15, left: 5, right: 5),
            width: double.infinity,
            height: 200,
            color: AppColors.blue,
            child: Column(
              children: [
                ListTile(
                  title: AppLargeText(
                    text: "Hey Halal",
                    color: AppColors.black1,
                    size: 22,
                  ),
                  trailing: AppIcons.bag,
                  iconColor: AppColors.black1,
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    style: TextStyle(color: AppColors.black1),
                    decoration: InputDecoration(
                      hintText: "Search Products or Store",
                      hintStyle: TextStyle(color: AppColors.black45),
                      prefixIconColor: AppColors.black1,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      fillColor: AppColors.darkBlue,
                      filled: true,
                      prefixIcon: AppIcons.search,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 200,
                        height: 45,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppSmallText(
                              text: "Delivery To",
                              color: AppColors.black45,
                            ),
                            Row(
                              children: [
                                AppLargeText(
                                  text: "Green Way 3000,Sylhet",
                                  color: AppColors.black10,
                                  size: 14,
                                ),
                                Icon(
                                  Icons.arrow_drop_down,
                                  color: AppColors.black1,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 45,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppSmallText(
                              text: "WITHIN",
                              color: AppColors.black45,
                            ),
                            Row(
                              children: [
                                AppLargeText(
                                  text: "1 HOUR",
                                  color: AppColors.black1,
                                  size: 14,
                                ),
                                Icon(
                                  Icons.arrow_drop_down,
                                  color: AppColors.black1,
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
