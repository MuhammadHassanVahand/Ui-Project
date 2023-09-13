import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mini_ui_project/data/addToCart.dart';
import 'package:mini_ui_project/data/addToFavourie.dart';
import 'package:mini_ui_project/screens/favourite.dart';
import 'package:mini_ui_project/screens/productDetails.dart';
import 'package:mini_ui_project/widget/appTopContainer.dart';

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
  final Function? onCartUpdated;
  final Function? ontopUpdated;

  const HomeScreenGridItem({
    super.key,
    required this.networkImage,
    required this.productName,
    required this.productType,
    required this.price,
    required this.details,
    required this.imageCount,
    required this.imagesForSlider,
    this.onCartUpdated,
    this.ontopUpdated,
  });

  @override
  State<HomeScreenGridItem> createState() => _HomeScreenGridItemState();
}

class _HomeScreenGridItemState extends State<HomeScreenGridItem> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double imageHeight = screenWidth < 600 ? 95 : 200;
    double boxSize = screenWidth < 700 ? 2 : 30;
    double largeTextSize = screenWidth < 700 ? 20 : 30;
    String itemKey = widget.productName;
    bool itemExists = favourite.any((item) => item["name"] == itemKey);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.black20,
        ),
        child: GestureDetector(
          onTap: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetails(
                  itamName: widget.productName,
                  catchPhrase: widget.productType,
                  price: widget.price,
                  image: widget.networkImage,
                  imageCount: widget.imageCount,
                  details: widget.details,
                  imagesForSlider: widget.imagesForSlider,
                  onCartUpdated: widget.onCartUpdated,
                  onTopUpdated: widget.ontopUpdated,
                ),
              ),
            );
            setState(() {});
          },
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 99,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage(
                        widget.networkImage,
                      ),
                      fit: BoxFit.cover),
                ),
              ),
              SizedBox(),
              Column(
                children: [
                  Wrap(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppSmallText(
                            text: widget.productName,
                            color: AppColors.black100,
                            size: 12,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (itemExists) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Remove from favourite"),
                                      duration: Duration(milliseconds: 600),
                                    ),
                                  );
                                  favourite.removeWhere(
                                    (element) => element["name"] == itemKey,
                                  );
                                } else {
                                  Map<String, dynamic> fAdding = {
                                    "name": widget.productName,
                                    "type": widget.productType,
                                    "price": widget.price,
                                    "image": widget.imagesForSlider,
                                    "details": widget.details,
                                  };
                                  favourite.add(fAdding);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("Item Added to Favourite!"),
                                      duration: Duration(milliseconds: 600),
                                    ),
                                  );
                                }
                              });
                            },
                            child: FaIcon(
                              FontAwesomeIcons.solidHeart,
                              color: itemExists ? Colors.pink : Colors.black,
                              size: 19,
                            ),
                          )
                        ],
                      ),
                    ],
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
                        height: 22,
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
                              InkWell(
                                onTap: () {
                                  setState(
                                    () {
                                      String itemKey = widget.productName;

                                      bool itemExists = addtoCart.any(
                                          (item) => item["name"] == itemKey);

                                      if (itemExists) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content:
                                                Text("Already in the cart"),
                                            duration:
                                                Duration(milliseconds: 600),
                                          ),
                                        );
                                      } else {
                                        Map<String, dynamic> item = {
                                          "name": widget.productName,
                                          "image": widget.imagesForSlider,
                                          "type": widget.productType,
                                          "price": widget.price.toDouble(),
                                          "details": widget.details,
                                          "quantity": quantity
                                        };
                                        addtoCart.add(item);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                                "Added Successfully to cart"),
                                            duration:
                                                Duration(milliseconds: 600),
                                          ),
                                        );
                                        widget.ontopUpdated?.call();
                                        widget.onCartUpdated?.call();
                                      }
                                    },
                                  );
                                },
                                child: FaIcon(
                                  FontAwesomeIcons.circlePlus,
                                  color: AppColors.blue,
                                  size: 22,
                                ),
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
