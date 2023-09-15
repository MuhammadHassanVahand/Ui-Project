import 'package:flutter/material.dart';
import 'package:mini_ui_project/constan/appColors.dart';
import 'package:mini_ui_project/data/addToCart.dart';
import 'package:mini_ui_project/screens/orders/currentOrders.dart';
import 'package:mini_ui_project/screens/orders/orders.dart';
import 'package:mini_ui_project/widget/appSmallText.dart';
import 'package:mini_ui_project/widget/customItemTotal.dart';

void addOrders(Map item) {
  orders.add(item);
}

class AddCard extends StatefulWidget {
  final double delivery;
  final double subTotal;
  final double total;
  final Function() clearCart;
  const AddCard(
      {super.key,
      required this.delivery,
      required this.subTotal,
      required this.total,
      required this.clearCart});

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Add Card"),
        iconTheme: IconThemeData(color: AppColors.black100),
        backgroundColor: AppColors.black1,
        titleTextStyle: TextStyle(color: AppColors.black100, fontSize: 20),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 50),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppSmallText(
                      text: "CARD HOLDER NAME",
                      color: AppColors.black45,
                      size: 15,
                    ),
                    TextField(
                      decoration: InputDecoration(hintText: "Name"),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    AppSmallText(
                      text: "CARD NUMBER",
                      color: AppColors.black45,
                      size: 15,
                    ),
                    TextField(
                      decoration: InputDecoration(hintText: "Card number"),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        int? intValue;
                        try {
                          intValue = int.parse(value);
                        } catch (e) {
                          intValue = null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppSmallText(
                                text: "EXP DATE",
                                color: AppColors.black45,
                                size: 15,
                              ),
                              TextField(
                                decoration:
                                    InputDecoration(hintText: "Exp Date"),
                                keyboardType: TextInputType.datetime,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppSmallText(
                                text: "CVC",
                                color: AppColors.black45,
                                size: 15,
                              ),
                              const TextField(
                                decoration: InputDecoration(hintText: "CVC"),
                                keyboardType: TextInputType.number,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 140,
            ),
            SizedBox(
              child: ItemTotalPrices(
                  buttonText: "Make A Payment",
                  onButtonPressed: () {
                    setState(() async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Orders(),
                        ),
                      );
                      for (var item in addtoCart) {
                        addOrders(item);
                      }
                      addtoCart.clear();
                      widget.clearCart.call();
                    });
                  },
                  delivery: widget.delivery,
                  subtotal: widget.subTotal,
                  total: widget.total),
            ),
          ],
        ),
      ),
    ));
  }
}
