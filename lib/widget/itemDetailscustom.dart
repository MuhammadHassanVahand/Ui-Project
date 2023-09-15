import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mini_ui_project/constan/appButton.dart';
import 'package:mini_ui_project/constan/appColors.dart';
import 'package:mini_ui_project/data/addToCart.dart';
import 'package:mini_ui_project/screens/home.dart';
import 'package:mini_ui_project/screens/shoppingBag.dart';
import 'package:mini_ui_project/widget/appLargeText.dart';
import 'package:mini_ui_project/widget/appSmallText.dart';

class ItemDetails extends StatefulWidget {
  final List<String> imagesForSlider;
  final String itemName;
  final String catchPhrase;
  final double price;
  final String details;
  final double? offer;
  final Function? ontopUpdated;
  const ItemDetails({
    super.key,
    required this.catchPhrase,
    required this.price,
    required this.details,
    this.offer = 30,
    required this.itemName,
    this.ontopUpdated,
    required this.imagesForSlider,
  });

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 200,
                        child: AppSmallText(
                          text: widget.catchPhrase,
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
                                text: "Rs.${widget.price - widget.offer!}",
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
                                    child: AppSmallText(
                                        text: "Rs. ${widget.offer} OFF")),
                              ),
                            ],
                          ),
                          AppSmallText(
                            text: "Reg. Price ${widget.price}",
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
                      AppSmallText(
                          color: AppColors.black45, text: widget.details),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom:
                                BorderSide(color: AppColors.black45, width: 1),
                          ),
                        ),
                        child: ExpansionTile(
                          title: AppSmallText(
                            text: "Nutritional facts",
                            color: AppColors.black100,
                          ),
                          children: const [
                            ListTile(
                              title: Text('Lorem ipsum'),
                            ),
                            ListTile(
                              title: Text('Dolor sit'),
                            ),
                            ListTile(
                              title: Text('Amet consectetur'),
                            ),
                            ListTile(
                              title: Text('Adipiscing elit'),
                            ),
                            ListTile(
                              title: Text('Suspendisse potenti'),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 1, color: AppColors.black45))),
                        child: ExpansionTile(
                          title: AppSmallText(
                            text: "Reviews",
                            color: AppColors.black100,
                          ),
                          children: [
                            ListTile(
                              title: AppSmallText(
                                  text: "Tabahi Reviews Bhai Sahab",
                                  color: AppColors.black100),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: Row(
              children: [
                AppButton(
                  onPressed: () {
                    setState(
                      () {
                        String itemKey = widget.itemName;

                        bool itemExists =
                            addtoCart.any((item) => item["name"] == itemKey);

                        if (itemExists) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Already in the cart"),
                              duration: Duration(milliseconds: 600),
                            ),
                          );
                        } else {
                          Map<String, dynamic> item = {
                            "name": widget.itemName,
                            "image": widget.imagesForSlider,
                            "type": widget.catchPhrase,
                            "price": widget.price.toDouble(),
                            "details": widget.details,
                            "quantity": quantity.toInt()
                          };
                          addtoCart.add(item);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Added Successfully to cart"),
                              duration: Duration(milliseconds: 600),
                            ),
                          );
                          widget.ontopUpdated?.call();
                        }
                      },
                    );
                  },
                  backgroundColor: AppColors.black1,
                  text: " Add to cart",
                  textColor: AppColors.blue,
                  width: MediaQuery.of(context).size.width * 0.49,
                ),
                const SizedBox(
                  width: 2,
                ),
                AppButton(
                  onPressed: () {
                    String itemKey = widget.itemName;

                    bool itemExists =
                        addtoCart.any((item) => item["name"] == itemKey);

                    if (itemExists) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Already in the cart"),
                          duration: Duration(milliseconds: 600),
                        ),
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShoppingCart(),
                        ),
                      );
                    } else {
                      Map<String, dynamic> item = {
                        "name": widget.itemName,
                        "image": widget.imagesForSlider,
                        "type": widget.catchPhrase,
                        "price": widget.price.toDouble(),
                        "details": widget.details,
                        "quantity": quantity.toInt()
                      };
                      addtoCart.add(item);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShoppingCart(),
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Added Successfully to cart"),
                          duration: Duration(milliseconds: 600),
                        ),
                      );
                      widget.ontopUpdated?.call();
                    }
                  },
                  text: " Buy Now",
                  textColor: AppColors.black1,
                  width: MediaQuery.of(context).size.width * 0.49,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
