import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mini_ui_project/constan/appButton.dart';
import 'package:mini_ui_project/constan/appColors.dart';
import 'package:mini_ui_project/constan/appIcons.dart';
import 'package:mini_ui_project/data/addToCart.dart';
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
  final Function? onCartUpdated;
  final Function? onTopUpdated;
  const ProductDetails({
    super.key,
    required this.itamName,
    required this.catchPhrase,
    required this.price,
    required this.details,
    required this.image,
    required this.imageCount,
    required this.imagesForSlider,
    this.onCartUpdated,
    this.onTopUpdated,
  });

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  void ontoptUpdated() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            TopBar(
              onTopGridUpdated: widget.onTopUpdated,
              onGridUpdated: widget.onCartUpdated,
              ontopUpdated: () {
                setState(() {});
              },
              text: widget.itamName,
            ),
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
              details: widget.details,
              itemName: widget.itamName,
              ontopUpdated: ontoptUpdated,
              imagesForSlider: widget.imagesForSlider,
            ),
          ],
        ),
      ),
    );
  }
}
