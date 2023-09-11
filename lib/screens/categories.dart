import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mini_ui_project/constan/appColors.dart';
import 'package:mini_ui_project/constan/appIcons.dart';
import 'package:mini_ui_project/data/categorydata.dart';
import 'package:mini_ui_project/screens/categories_item/vegetables.dart';
import 'package:mini_ui_project/widget/appLargeText.dart';
import 'package:mini_ui_project/widget/appSmallText.dart';
import 'package:mini_ui_project/widget/appTopContainer.dart';
import 'package:mini_ui_project/widget/customGridView.dart';

class Catedories extends StatefulWidget {
  const Catedories({super.key});

  @override
  State<Catedories> createState() => _CatedoriesState();
}

class _CatedoriesState extends State<Catedories> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double largeText = screenWidth < 600 ? 15 : 30;
    double smallText = screenWidth < 600 ? 10 : 18;
    double imageHeight = screenWidth < 600 ? 115 : 200;

    return SafeArea(
      child: Scaffold(
        extendBody: true,
        body: Column(
          children: [
            Container(
              height: 200,
              child: TopContainer(
                svgPicture: SvgPicture.asset(
                  "assets/images/Search.svg",
                ),
                contant: Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppSmallText(
                        text: "Shop",
                        color: AppColors.black1,
                        size: 50,
                        fontWeight: FontWeight.w300,
                      ),
                      AppLargeText(
                        text: "By Category",
                        color: AppColors.black1,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 263,
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 2),
                itemCount: category.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => category[index]["subtype"],
                          ),
                        );
                        setState(() {});
                      },
                      child: Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColors.black10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 115,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  category[index]["image"],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            AppLargeText(
                              text: category[index]["name"],
                              color: AppColors.black90,
                              size: 15,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              child: AppSmallText(
                                text: category[index]["type"],
                                color: AppColors.black60,
                                size: 10,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
