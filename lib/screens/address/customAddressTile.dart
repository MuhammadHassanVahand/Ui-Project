import 'package:flutter/material.dart';
import 'package:mini_ui_project/constan/appButton.dart';
import 'package:mini_ui_project/constan/appColors.dart';
import 'package:mini_ui_project/screens/addCard/addCard.dart';
import 'package:mini_ui_project/screens/address/address.dart';
import 'package:mini_ui_project/screens/address/addressWidget.dart';
import 'package:mini_ui_project/widget/appSmallText.dart';

class AddressTile extends StatefulWidget {
  final double delivery;
  final double subTotal;
  final double total;
  final Function() clearCart;
  const AddressTile(
      {super.key,
      required this.delivery,
      required this.subTotal,
      required this.total,
      required this.clearCart});

  @override
  State<AddressTile> createState() => _AddressTileState();
}

class _AddressTileState extends State<AddressTile> {
  TextEditingController locationEditController = TextEditingController();
  TextEditingController addressEditContoler = TextEditingController();

  editAddress(index) {
    setState(() {
      address[index]["location"] = locationEditController.text;
      address[index]["address"] = addressEditContoler.text;
      addressEditContoler.clear();
      locationEditController.clear();
      Navigator.pop(context);
    });
  }

  void updateAddress() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            child: Container(
              height: 550,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 50),
                      child: AppSmallText(
                        text: "Delivery Address",
                        color: AppColors.black100,
                        size: 25,
                      ),
                    ),
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: address.length,
                      itemBuilder: (context, index) {
                        final isSelected = address[index]["isSelected"];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                for (int i = 0; i < address.length; i++) {
                                  address[i]["isSelected"] = false;
                                }
                                address[index]["isSelected"] = !isSelected;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 3,
                                    color: isSelected == false
                                        ? AppColors.black45
                                        : AppColors.orange),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: 100,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AppSmallText(
                                          text: address[index]["location"],
                                          color: AppColors.black100,
                                          size: 18,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width: 200,
                                          child: Text(
                                            address[index]["address"],
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Column(
                                      children: [
                                        isSelected == true
                                            ? Icon(
                                                Icons.check_circle,
                                                color: AppColors.orange,
                                              )
                                            : Icon(
                                                Icons.radio_button_unchecked),
                                        Column(
                                          children: [
                                            TextButton(
                                              onPressed: () {
                                                locationEditController.text =
                                                    address[index]["location"];
                                                addressEditContoler.text =
                                                    address[index]["address"];

                                                showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return AlertDialog(
                                                      title: AppSmallText(
                                                        text: "Edit Address",
                                                        color:
                                                            AppColors.black100,
                                                      ),
                                                      content: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Container(
                                                            height: 100,
                                                            width: 200,
                                                            child: TextField(
                                                              controller:
                                                                  locationEditController,
                                                              decoration:
                                                                  InputDecoration(
                                                                      hintText:
                                                                          "location"),
                                                            ),
                                                          ),
                                                          Container(
                                                            height: 100,
                                                            width: 300,
                                                            child: TextField(
                                                              controller:
                                                                  addressEditContoler,
                                                              decoration:
                                                                  InputDecoration(
                                                                      hintText:
                                                                          "address"),
                                                            ),
                                                          ),
                                                          ElevatedButton(
                                                            onPressed: () {
                                                              editAddress(
                                                                  index);
                                                            },
                                                            child: Container(
                                                              height: 50,
                                                              width: 100,
                                                              child: Center(
                                                                child: AppSmallText(
                                                                    text:
                                                                        "Save edits"),
                                                              ),
                                                            ),
                                                          ),
                                                          ElevatedButton(
                                                            onPressed: () {
                                                              setState(() {
                                                                address
                                                                    .removeAt(
                                                                        index);
                                                                Navigator.pop(
                                                                    context);
                                                              });
                                                            },
                                                            child: AppSmallText(
                                                                text:
                                                                    "Delete Address"),
                                                            style: ButtonStyle(
                                                                backgroundColor:
                                                                    MaterialStateProperty
                                                                        .all(Colors
                                                                            .red)),
                                                          )
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                              child: Text("Edit"),
                                            ),
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    AddAddress(updateAddress: updateAddress),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Column(
            children: [
              Center(
                child: AppButton(
                  onPressed: () {
                    bool isAddressSelected = false;
                    for (int i = 0; i < address.length; i++) {
                      if (address[i]["isSelected"] == true) {
                        isAddressSelected = true;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddCard(
                              delivery: widget.delivery,
                              subTotal: widget.subTotal,
                              total: widget.total,
                              clearCart: widget.clearCart,
                            ),
                          ),
                        );
                        break;
                      }
                    }
                    if (!isAddressSelected) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Select Address!"),
                          duration: Duration(milliseconds: 600),
                        ),
                      );
                    }
                  },
                  textColor: AppColors.black1,
                  text: "Add Card",
                  width: MediaQuery.of(context).size.width * 0.9,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
