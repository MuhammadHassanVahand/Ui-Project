import 'package:flutter/material.dart';
import 'package:mini_ui_project/constan/appColors.dart';
import 'package:mini_ui_project/screens/address/address.dart';
import 'package:mini_ui_project/widget/appSmallText.dart';

class AddAddress extends StatefulWidget {
  const AddAddress({super.key});

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  TextEditingController locationAddController = TextEditingController();
  TextEditingController addressAddContoler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: AppSmallText(
                    text: "Add Address",
                    color: AppColors.black100,
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 100,
                        width: 200,
                        child: TextField(
                          controller: locationAddController,
                          decoration: InputDecoration(
                              hintText: "location like Home/Office"),
                        ),
                      ),
                      Container(
                        height: 100,
                        width: 300,
                        child: TextField(
                          controller: addressAddContoler,
                          decoration: InputDecoration(hintText: "location"),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            Map<String, dynamic> addAdress = {
                              "location": locationAddController.text,
                              "address": addressAddContoler.text,
                              "isSelected": false
                            };
                            address.add(addAdress);
                            addressAddContoler.clear();
                            locationAddController.clear();
                            Navigator.pop(context);
                          });
                        },
                        child: Container(
                          height: 50,
                          width: 100,
                          child: Center(
                            child: AppSmallText(text: "Save edits"),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
          icon: Icon(
            Icons.add_circle_outline,
            color: AppColors.orange,
            size: 30,
          ),
        ),
        AppSmallText(
          text: "Add New Address",
          color: AppColors.black100,
          size: 20,
        ),
      ],
    );
  }
}
