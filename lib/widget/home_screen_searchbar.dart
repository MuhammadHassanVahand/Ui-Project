import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mini_ui_project/screens/productDetails.dart';

import '../constan/appColors.dart';
import '../constan/appIcons.dart';
import 'appLargeText.dart';
import 'appSmallText.dart';

class SearchAndOption extends StatelessWidget {
  const SearchAndOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
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
        SizedBox(
          height: 12,
        ),
        Row(
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
        )
      ],
    );
  }
}

class HomeScreenGridItem extends StatefulWidget {
  final String networkImage;
  final String productName;
  final String productType;
  final double price;
  final String details;
  final int imageCount;
  final List<String> imagesForSlider;
  const HomeScreenGridItem({
    super.key,
    required this.networkImage,
    required this.productName,
    required this.productType,
    required this.price,
    required this.details,
    required this.imageCount,
    required this.imagesForSlider,
  });

  @override
  State<HomeScreenGridItem> createState() => _HomeScreenGridItemState();
}

class _HomeScreenGridItemState extends State<HomeScreenGridItem> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double imageHeight = screenWidth < 600 ? 95 : 200;
    double boxSize = screenWidth < 700 ? 2 : 30;
    double largeTextSize = screenWidth < 700 ? 20 : 30;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.black20,
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetails(
                  itamName: widget.productName,
                  catchPhrase: widget.productType,
                  price: widget.price,
                  image: widget.networkImage,
                  imageCount: widget.imageCount,
                  details: widget.details,
                  imagesForSlider: widget.imagesForSlider!,
                ),
              ),
            );
          },
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 93,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    widget.networkImage,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppSmallText(
                    text: widget.productName,
                    color: AppColors.black100,
                    size: 20,
                  ),
                  AppSmallText(
                    text: widget.productType,
                    color: AppColors.black60,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 130,
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(90),
                          color: AppColors.black1,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  AppSmallText(
                                      text: "Unit", color: AppColors.black45),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  AppLargeText(
                                    text: "Rs. ${widget.price}",
                                    color: AppColors.black100,
                                    size: 15,
                                  ),
                                ],
                              ),
                              FaIcon(
                                FontAwesomeIcons.circlePlus,
                                color: AppColors.blue,
                                size: 20,
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
