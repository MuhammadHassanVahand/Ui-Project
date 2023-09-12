import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mini_ui_project/constan/appColors.dart';
import 'package:mini_ui_project/constan/appIcons.dart';
import 'package:mini_ui_project/data/addToCart.dart';
import 'package:mini_ui_project/screens/shoppingBag.dart';
import 'package:mini_ui_project/widget/appLargeText.dart';
import 'package:mini_ui_project/widget/appSmallText.dart';

class TopContainer extends StatefulWidget {
  final Icon? backIcon;
  final String? text;
  final Widget? contant;
  final Icon? icon;
  final SvgPicture? svgPicture;
  final Color backgroundColor;
  final double? height;
  final Function? onCartUpdated;

  const TopContainer({
    Key? key,
    this.icon,
    this.contant,
    this.svgPicture,
    this.text = "Hey Halal",
    this.backgroundColor = const Color(0xff2A4BA0),
    this.backIcon,
    this.height = 200,
    this.onCartUpdated,
  }) : super(key: key);

  @override
  _TopContainerState createState() => _TopContainerState();
}

class _TopContainerState extends State<TopContainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (context) {
        return Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              width: double.infinity,
              height: widget.height,
              color: widget.backgroundColor,
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (widget.backIcon != null)
                      Container(
                        child: widget.backIcon,
                      ),
                    AppLargeText(
                      size: 22,
                      text: widget.text!,
                      color: AppColors.black1,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: widget.svgPicture,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ShoppingCart(),
                              ),
                            );
                            setState(() {});
                          },
                          child: Stack(
                            children: [
                              AppIcons.bag,
                              Positioned(
                                top: 0,
                                right: 0,
                                child: CircleAvatar(
                                  backgroundColor: AppColors.yellow,
                                  radius: 7,
                                  child: Text(
                                    "${addtoCart.length}",
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 18),
                Container(
                  child: widget.contant,
                ),
              ]),
            ),
          ],
        );
      }),
    );
  }
}

class TopBar extends StatefulWidget {
  final SvgPicture? svgPicture;
  final Function? ontopUpdated;
  final String? text;
  const TopBar({super.key, this.svgPicture, this.ontopUpdated, this.text});

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: AppIcons.backIcon),
              SizedBox(
                width: 40,
              ),
              AppSmallText(
                text: widget.text!,
                color: AppColors.black100,
                size: 20,
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(child: widget.svgPicture),
              InkWell(
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ShoppingCart(),
                      ),
                    );
                    setState(() {});
                  },
                  child: Stack(
                    children: [
                      AppIcons.bag_Black,
                      Positioned(
                        top: 0,
                        right: 0,
                        child: CircleAvatar(
                          backgroundColor: AppColors.yellow,
                          radius: 7,
                          child: Text(
                            "${addtoCart.length}",
                            style: const TextStyle(fontSize: 10),
                          ),
                        ),
                      ),
                    ],
                  )),
            ],
          )
        ],
      ),
    );
  }
}
