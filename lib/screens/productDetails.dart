import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mini_ui_project/constan/appButton.dart';
import 'package:mini_ui_project/constan/appColors.dart';
import 'package:mini_ui_project/constan/appIcons.dart';
import 'package:mini_ui_project/data/recomendedProduct.dart';
import 'package:mini_ui_project/widget/appLargeText.dart';
import 'package:mini_ui_project/widget/appSmallText.dart';
import 'package:mini_ui_project/widget/appTopContainer.dart';
import 'package:mini_ui_project/widget/home_slider.dart';
import 'package:mini_ui_project/widget/itemDetailscustom.dart';

class ProductDetails extends StatefulWidget {
  final String image;
  final String itamName;
  final String catchPhrase;
  final double price;
  final String details;
  final int imageCount;
  final List<String> imagesForSlider;
  const ProductDetails({
    super.key,
    required this.itamName,
    required this.catchPhrase,
    required this.price,
    required this.details,
    required this.image,
    required this.imageCount,
    required this.imagesForSlider,
  });

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            TopBar(text: widget.itamName),
            ImageSlider(
              imagesForSlider: widget.imagesForSlider,
              imageLength: widget.imageCount,
              image: widget.image,
            ),
            const SizedBox(
              height: 2,
            ),
            ItemDetails(
                catchPhrase: widget.catchPhrase,
                price: widget.price,
                details: widget.details),
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: Row(
                  children: [
                    AppButton(
                      backgroundColor: AppColors.black1,
                      text: " Add to cart",
                      textColor: AppColors.blue,
                      width: MediaQuery.of(context).size.width * 0.49,
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    AppButton(
                      text: " Buy Now",
                      textColor: AppColors.black1,
                      width: MediaQuery.of(context).size.width * 0.49,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
