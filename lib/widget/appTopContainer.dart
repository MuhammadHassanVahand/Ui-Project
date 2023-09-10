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
  final String text;
  final Widget? contant;
  final Icon? icon;
  final SvgPicture? svgPicture;
  final Color backgroundColor;
  final double? height;

  const TopContainer({
    Key? key,
    this.icon,
    this.contant,
    this.svgPicture,
    this.text = "Hey Halal",
    this.backgroundColor = const Color(0xff2A4BA0),
    this.backIcon,
    this.height = 200,
  }) : super(key: key);

  @override
  _TopContainerState createState() => _TopContainerState();
}

class _TopContainerState extends State<TopContainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                    text: widget.text,
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
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ShoppingCart(),
                            ),
                          );
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
      ),
    );
  }
}

// class TopContainer extends StatelessWidget {
//   final Icon? backIcon;
//   final String text;
//   final Widget? contant;
//   final Icon? icon;
//   final SvgPicture? svgPicture;
//   final Color backgroundColor;
//   final double? height;
//   const TopContainer({
//     super.key,
//     this.icon,
//     this.contant,
//     this.svgPicture,
//     this.text = "Hey Halal",
//     this.backgroundColor = const Color(0xff2A4BA0),
//     this.backIcon,
//     this.height = 200,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//             width: double.infinity,
//             height: height,
//             color: backgroundColor,
//             child: Column(children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   if (backIcon != null)
//                     Container(
//                       child: backIcon,
//                     ),
//                   AppLargeText(
//                     size: 22,
//                     text: text,
//                     color: AppColors.black1,
//                   ),
//                   Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Container(
//                         child: svgPicture,
//                       ),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       InkWell(
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => ShoppingCart(),
//                               ),
//                             );
//                           },
//                           child: Stack(children: [
//                             AppIcons.bag,
//                             Positioned(
//                               top: 0,
//                               right: 0,
//                               child: CircleAvatar(
//                                 backgroundColor: AppColors.yellow,
//                                 radius: 7,
//                                 child: Text(
//                                   "${addtoCart.length}",
//                                   style: TextStyle(fontSize: 10),
//                                 ),
//                               ),
//                             ),
//                           ])),
//                     ],
//                   )
//                 ],
//               ),
//               SizedBox(height: 18),
//               Container(
//                 child: contant,
//               )
//             ]),
//           ),
//         ],
//       ),
//     );
//   }
// }

class TopBar extends StatelessWidget {
  final SvgPicture? svgPicture;
  final String text;
  const TopBar({super.key, this.svgPicture, required this.text});

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
                text: text,
                color: AppColors.black100,
                size: 20,
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(child: svgPicture),
              InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ShoppingCart(),
                      ),
                    );
                  },
                  child: AppIcons.bag_Black),
            ],
          )
        ],
      ),
    );
  }
}




// Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: TextField(
//                       style: TextStyle(color: AppColors.black1),
//                       decoration: InputDecoration(
//                         hintText: "Search Products or Store",
//                         hintStyle: TextStyle(color: AppColors.black45),
//                         prefixIconColor: AppColors.black1,
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(100),
//                         ),
//                         fillColor: AppColors.darkBlue,
//                         filled: true,
//                         prefixIcon: AppIcons.search,
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 8,
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 15),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Container(
//                           width: 200,
//                           height: 45,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               AppSmallText(
//                                 text: "Delivery To",
//                                 color: AppColors.black45,
//                               ),
//                               Row(
//                                 children: [
//                                   AppLargeText(
//                                     text: "Green Way 3000,Sylhet",
//                                     color: AppColors.black10,
//                                     size: 14,
//                                   ),
//                                   Icon(
//                                     Icons.arrow_drop_down,
//                                     color: AppColors.black1,
//                                   )
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                         Container(
//                           width: 100,
//                           height: 45,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               AppSmallText(
//                                 text: "WITHIN",
//                                 color: AppColors.black45,
//                               ),
//                               Row(
//                                 children: [
//                                   AppLargeText(
//                                     text: "1 HOUR",
//                                     color: AppColors.black1,
//                                     size: 14,
//                                   ),
//                                   Icon(
//                                     Icons.arrow_drop_down,
//                                     color: AppColors.black1,
//                                   )
//                                 ],
//                               )
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   )