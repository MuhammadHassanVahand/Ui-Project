import 'package:flutter/material.dart';
import 'package:mini_ui_project/constan/appColors.dart';
import 'package:mini_ui_project/widget/appSmallText.dart';

class AppButton extends StatelessWidget {
  final Color textColor;
  final String text;
  final Color backgroundColor;
  final double? width;
  final Function()? onPressed;
  final double? height;
  const AppButton({
    super.key,
    required this.textColor,
    required this.text,
    this.backgroundColor = const Color(0xff2A4BA0),
    this.width = 200,
    this.onPressed,
    this.height = 60,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5, top: 2),
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            foregroundColor: AppColors.black45,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            side: BorderSide(width: 2, color: AppColors.blue)),
        onPressed: () {
          onPressed;
        },
        child: AppSmallText(
          text: text,
          size: 19,
          color: textColor,
        ),
      ),
    );
  }
}
