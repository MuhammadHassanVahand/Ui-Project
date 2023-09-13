import 'package:flutter/material.dart';
import 'package:mini_ui_project/constan/appColors.dart';
import 'package:mini_ui_project/screens/address/address.dart';
import 'package:mini_ui_project/widget/appSmallText.dart';

class AddressTile extends StatefulWidget {
  const AddressTile({super.key});

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

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Expanded(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: address.length,
          itemBuilder: (context, index) {
            final isSelected = address[index]["isSelected"];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                : Icon(Icons.radio_button_unchecked),
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
                                              color: AppColors.black100,
                                            ),
                                            content: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Container(
                                                  height: 100,
                                                  width: 200,
                                                  child: TextField(
                                                    controller:
                                                        locationEditController,
                                                    decoration: InputDecoration(
                                                        hintText: "location"),
                                                  ),
                                                ),
                                                Container(
                                                  height: 100,
                                                  width: 300,
                                                  child: TextField(
                                                    controller:
                                                        addressEditContoler,
                                                    decoration: InputDecoration(
                                                        hintText: "address"),
                                                  ),
                                                ),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    editAddress(index);
                                                  },
                                                  child: Container(
                                                    height: 50,
                                                    width: 100,
                                                    child: Center(
                                                      child: AppSmallText(
                                                          text: "Save edits"),
                                                    ),
                                                  ),
                                                ),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      address.removeAt(index);
                                                      Navigator.pop(context);
                                                    });
                                                  },
                                                  child: AppSmallText(
                                                      text: "Delete Address"),
                                                  style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all(Colors.red)),
                                                )
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                      ;
                                    },
                                    child: Text("Edit")),
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
      ),
    );
  }
}
