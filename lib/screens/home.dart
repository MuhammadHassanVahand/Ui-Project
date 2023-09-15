import 'package:flutter/material.dart';
import 'package:mini_ui_project/constan/appColors.dart';
import 'package:mini_ui_project/data/recomendedProduct.dart';
import 'package:mini_ui_project/widget/appSmallText.dart';
import 'package:mini_ui_project/widget/appTopContainer.dart';
import 'package:mini_ui_project/widget/home_screen_searchbar.dart';
import 'package:mini_ui_project/widget/home_slider.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void onCartUpdated() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double imageHeight = screenWidth < 600 ? 95 : 200;
    double boxSize = screenWidth < 700 ? 2 : 30;
    double largeTextSize = screenWidth < 700 ? 20 : 30;

    return SafeArea(
      child: Scaffold(
        extendBody: true,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 200,
              color: AppColors.blue,
              child: TopContainer(
                onCartUpdated: () {
                  setState(() {});
                },
                contant: SearchAndOption(),
              ),
            ),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HomeBanner(),
                  HomeBanner(),
                  HomeBanner(),
                  HomeBanner(),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: AppSmallText(
                text: "Recommended",
                color: AppColors.black100,
                size: 30,
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 263,
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 2),
                itemCount: recomanded.length,
                itemBuilder: (context, index) {
                  return HomeScreenGridItem(
                    networkImage: recomanded[index]["image"][0],
                    productName: recomanded[index]["name"],
                    productType: recomanded[index]["type"],
                    price: recomanded[index]["price"],
                    details: recomanded[index]["details"],
                    imageCount: recomanded[index]["image"].length,
                    imagesForSlider: recomanded[index]["image"],
                    onCartUpdated: onCartUpdated,
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
