import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mini_ui_project/constan/appColors.dart';
import 'package:mini_ui_project/widget/appLargeText.dart';
import 'package:mini_ui_project/widget/appSmallText.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class TrackOrders extends StatefulWidget {
  final String itemName;
  final String imagesForSlider;
  final String productType;
  final double price;
  const TrackOrders({
    super.key,
    required this.itemName,
    required this.imagesForSlider,
    required this.productType,
    required this.price,
  });

  @override
  State<TrackOrders> createState() => _TrackOrdersState();
}

class _TrackOrdersState extends State<TrackOrders> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Track Order"),
          iconTheme: IconThemeData(color: AppColors.black100),
          backgroundColor: AppColors.black1,
          titleTextStyle: TextStyle(color: AppColors.black100, fontSize: 20),
        ),
        body: SlidingUpPanel(
          panel: Container(
            width: double.infinity,
            height: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: NetworkImage(widget.imagesForSlider),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppSmallText(
                            text: "Item Name:",
                            color: AppColors.black45,
                            size: 18,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          AppSmallText(
                            text: widget.itemName,
                            color: AppColors.black100,
                            size: 18,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          AppSmallText(
                            text: "Item Type0:",
                            color: AppColors.black45,
                            size: 18,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          AppSmallText(
                            text: widget.productType,
                            color: AppColors.black100,
                            size: 18,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppSmallText(
                            text: "After Discount:",
                            color: AppColors.black45,
                            size: 18,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          AppSmallText(
                            text: "Rs.${widget.price - 30}",
                            color: AppColors.black100,
                            size: 18,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          AppSmallText(
                            text: "Before discount:",
                            color: AppColors.black45,
                            size: 18,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          AppSmallText(
                            text: "Rs.${widget.price}",
                            color: AppColors.black100,
                            size: 18,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          collapsed: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Text(
              " Order Details (ID # 789865462)",
              style: TextStyle(fontSize: 20),
            ),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 400,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://t4.ftcdn.net/jpg/02/65/42/55/360_F_265425516_wtAw64cGdOVvrdl64b5bsyBqcD0rkw1W.jpg"),
                            fit: BoxFit.cover),
                        color: AppColors.black20,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.92,
                        height: 70,
                        decoration: BoxDecoration(
                          color: AppColors.black10,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        "https://img.freepik.com/premium-vector/delivery-man-riding-red-scooter-illustration_9845-14.jpg"),
                                    backgroundColor: AppColors.yellow,
                                    radius: 30,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      AppSmallText(
                                        text: "Deivery Man",
                                        color: AppColors.black100,
                                        size: 17,
                                      ),
                                      AppLargeText(
                                        text: "Driver",
                                        color: AppColors.black100,
                                        size: 17,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              CircleAvatar(
                                child: FaIcon(FontAwesomeIcons.solidMessage,
                                    color: AppColors.black1),
                                backgroundColor: AppColors.blue,
                                radius: 25,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.watch_later_outlined,
                      color: AppColors.black45,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppSmallText(
                          text: "Delivery In",
                          color: AppColors.black45,
                        ),
                        AppSmallText(
                          text: "25 Min",
                          color: AppColors.black100,
                        )
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: AppColors.black45,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppSmallText(
                          text: "Delivery Address",
                          color: AppColors.black45,
                        ),
                        AppSmallText(
                          text: "37 New line, Sunamganj",
                          color: AppColors.black100,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
