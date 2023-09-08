import 'package:flutter/material.dart';

class AppSmallText extends StatelessWidget {
  final String text;
  final double? size;
  final Color color;
  final FontWeight? fontWeight;
  AppSmallText({
    super.key,
    required this.text,
    this.color = Colors.white,
    this.size,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
      ),
      softWrap: true,
    );
  }
}
