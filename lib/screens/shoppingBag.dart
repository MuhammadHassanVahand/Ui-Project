import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mini_ui_project/constan/appButton.dart';
import 'package:mini_ui_project/constan/appColors.dart';
import 'package:mini_ui_project/data/addToCart.dart';
import 'package:mini_ui_project/screens/productDetails.dart';
import 'package:mini_ui_project/widget/appLargeText.dart';
import 'package:mini_ui_project/widget/appSmallText.dart';
import 'package:mini_ui_project/widget/customItemTotal.dart';
import 'package:mini_ui_project/widget/customListViewBuilder.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({super.key});

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  double _subtotal = 0.0;
  double _delivery = 0.0;
  double _total = 0.0;

  @override
  void initState() {
    super.initState();
    _calculatePrices();
  }

  void _calculatePrices() {
    double subtotal = 0.0;
    for (var item in addtoCart) {
      int quantity = item["quantity"];
      double price = item["price"];
      double totalPrice = (price - 30) * quantity;
      subtotal = subtotal + totalPrice;
    }
    double delivery = 100;
    double total = delivery + subtotal;

    setState(() {
      _subtotal = subtotal;
      _delivery = delivery;
      _total = total;
    });
  }

  void _updateQuantity(int index, int newQuantity) {
    setState(() {
      addtoCart[index]["quantity"] = newQuantity;
      _calculatePrices();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shpping beg"),
        iconTheme: IconThemeData(color: AppColors.black100),
        backgroundColor: AppColors.black1,
        titleTextStyle: TextStyle(color: AppColors.black100, fontSize: 20),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: NetworkImage(
                      "https://t3.ftcdn.net/jpg/03/16/77/16/360_F_316771680_9Cxzitk4ZTp8y5thEJYiqFmlj4lIjF8i.jpg"),
                  fit: BoxFit.cover),
            ),
          ),
          Expanded(
            child: addtoCart.isNotEmpty
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: addtoCart.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Container(
                          width: double.infinity,
                          height: 80,
                          decoration: BoxDecoration(
                              color: AppColors.black20,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductDetails(
                                        itamName: addtoCart[index]["name"],
                                        catchPhrase: addtoCart[index]["type"],
                                        price: addtoCart[index]["price"],
                                        details: addtoCart[index]["details"],
                                        image: addtoCart[index]["image"][0],
                                        imageCount:
                                            addtoCart[index]["image"].length,
                                        imagesForSlider: addtoCart[index]
                                            ["image"]),
                                  ),
                                );
                              },
                              child: ListTile(
                                leading: Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          addtoCart[index]["image"][0],
                                        ),
                                        fit: BoxFit.cover),
                                  ),
                                  child: IconButton(
                                      icon: Icon(Icons.close),
                                      onPressed: () {
                                        setState(() {
                                          addtoCart.removeAt(index);
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content:
                                                  Text("Remove Successfully"),
                                              duration:
                                                  Duration(milliseconds: 600),
                                            ),
                                          );
                                          _calculatePrices();
                                        });
                                      }),
                                ),
                                title: AppLargeText(
                                  text: addtoCart[index]["name"],
                                  color: AppColors.black100,
                                  size: 15,
                                ),
                                subtitle: AppSmallText(
                                  text: "Rs.${addtoCart[index]["price"] - 30}",
                                  color: AppColors.black90,
                                  size: 17,
                                ),
                                trailing: Container(
                                  height: 70,
                                  width: 150,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          int currentQuantity =
                                              addtoCart[index]["quantity"];
                                          if (currentQuantity > 1) {
                                            _updateQuantity(
                                                index, currentQuantity - 1);
                                          }
                                          ;
                                        },
                                        child: CircleAvatar(
                                          radius: 15,
                                          backgroundColor: AppColors.black10,
                                          child: FaIcon(
                                            FontAwesomeIcons.minus,
                                            color: AppColors.black100,
                                            size: 15,
                                          ),
                                        ),
                                      ),
                                      AppLargeText(
                                        text: "${addtoCart[index]["quantity"]}",
                                        color: AppColors.black100,
                                        size: 18,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          int currentQuantity =
                                              addtoCart[index]["quantity"];

                                          _updateQuantity(
                                              index, currentQuantity + 1);
                                        },
                                        child: CircleAvatar(
                                          radius: 15,
                                          backgroundColor: AppColors.black10,
                                          child: FaIcon(
                                            FontAwesomeIcons.plus,
                                            color: AppColors.black100,
                                            size: 15,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : Center(
                    child: AppSmallText(
                      text: "Cart is Emplty",
                      color: AppColors.black100,
                      size: 20,
                    ),
                  ),
          ),
          ItemTotalPrices(
              delivery: _delivery, subtotal: _subtotal, total: _total)
        ],
      ),
    );
  }
}
