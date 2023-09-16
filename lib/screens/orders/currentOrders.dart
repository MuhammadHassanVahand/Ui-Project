import 'package:flutter/material.dart';
import 'package:mini_ui_project/constan/appButton.dart';
import 'package:mini_ui_project/constan/appColors.dart';
import 'package:mini_ui_project/screens/trackOrders/trackOrders.dart';
import 'package:mini_ui_project/widget/appLargeText.dart';
import 'package:mini_ui_project/widget/appSmallText.dart';

List<Map> orders = [];

class CurrentOrders extends StatefulWidget {
  const CurrentOrders({super.key});

  @override
  State<CurrentOrders> createState() => _CurrentOrdersState();
}

class _CurrentOrdersState extends State<CurrentOrders> {
  @override
  Widget build(BuildContext context) {
    return orders.isEmpty
        ? Center(child: Text("No Orders Done yet"))
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              itemCount: orders.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, crossAxisSpacing: 5, mainAxisSpacing: 5),
              itemBuilder: (context, index) {
                return Container(
                  height: 300,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 2, color: AppColors.black20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Container(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              orders[index]["image"][0]),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      AppLargeText(
                                        text: orders[index]["name"],
                                        size: 11,
                                        color: AppColors.black100,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      AppSmallText(
                                        text: "Rs.${orders[index]["price"]}",
                                        color: AppColors.black100,
                                        size: 17,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            AppSmallText(
                              text: "ID # 789865462",
                              color: AppColors.black100,
                              size: 17,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  width: 180,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            orders[index]["image"][1]),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                Positioned(
                                  bottom: 10,
                                  right: 70,
                                  child: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        "https://img.freepik.com/premium-vector/delivery-man-riding-red-scooter-illustration_9845-14.jpg"),
                                    backgroundColor: AppColors.yellow,
                                    radius: 30,
                                  ),
                                )
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppSmallText(
                                  text: orders[index]["type"],
                                  color: AppColors.black100,
                                  size: 20,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                AppLargeText(
                                  text: "On the Way",
                                  color: AppColors.black100,
                                  size: 20,
                                ),
                                AppButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => TrackOrders(
                                          imagesForSlider: orders[index]
                                              ["image"][0],
                                          itemName: orders[index]["name"],
                                          price: orders[index]["price"],
                                          productType: orders[index]["type"],
                                          quantity: orders[index]["quantity"],
                                          address: orders[index]["address"],
                                        ),
                                      ),
                                    );
                                  },
                                  textColor: AppColors.black1,
                                  text: "TrackOrder",
                                  width:
                                      MediaQuery.of(context).size.width * 0.40,
                                  height: 60,
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: AppSmallText(
                            text: "Meet Our Rider",
                            color: AppColors.black60,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          );
  }
}
