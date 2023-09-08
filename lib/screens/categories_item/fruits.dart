import 'package:flutter/material.dart';
import 'package:mini_ui_project/constan/appColors.dart';
import 'package:mini_ui_project/data/fruits.dart';
import 'package:mini_ui_project/widget/appTopContainer.dart';
import 'package:mini_ui_project/widget/home_screen_searchbar.dart';

class Fruits extends StatefulWidget {
  const Fruits({super.key});

  @override
  State<Fruits> createState() => _FruitsState();
}

class _FruitsState extends State<Fruits> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            TopBar(text: "Fruits"),
            TabBar(
              controller: _tabController,
              tabs: [
                Tab(
                  text: "Citrus Fruits",
                ),
                Tab(
                  text: "Berries",
                ),
                Tab(
                  text: "Tropical Fruits",
                ),
              ],
              unselectedLabelColor: AppColors.black100,
              labelColor: AppColors.black1,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(90),
                  color: AppColors.yellow),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  CitrusFruits(),
                  Berries(),
                  TropicalFruits(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CitrusFruits extends StatefulWidget {
  const CitrusFruits({super.key});

  @override
  State<CitrusFruits> createState() => _CitrusFruitsState();
}

class _CitrusFruitsState extends State<CitrusFruits> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 263, crossAxisSpacing: 2, mainAxisSpacing: 2),
      itemCount: citrusFruits.length,
      itemBuilder: (context, index) {
        return HomeScreenGridItem(
          networkImage: citrusFruits[index]["image"][0],
          productName: citrusFruits[index]["name"],
          productType: citrusFruits[index]["type"],
          price: citrusFruits[index]["price"],
          details: citrusFruits[index]["details"],
          imageCount: citrusFruits[index]["image"].length,
          imagesForSlider: citrusFruits[index]["image"],
        );
      },
    );
  }
}

class Berries extends StatefulWidget {
  const Berries({super.key});

  @override
  State<Berries> createState() => _BerriesState();
}

class _BerriesState extends State<Berries> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 263, crossAxisSpacing: 2, mainAxisSpacing: 2),
      itemCount: berries.length,
      itemBuilder: (context, index) {
        return HomeScreenGridItem(
          networkImage: berries[index]["image"][0],
          productName: berries[index]["name"],
          productType: berries[index]["type"],
          price: berries[index]["price"],
          details: berries[index]["details"],
          imageCount: berries[index]["image"].length,
          imagesForSlider: berries[index]["image"],
        );
      },
    );
  }
}

class TropicalFruits extends StatefulWidget {
  const TropicalFruits({super.key});

  @override
  State<TropicalFruits> createState() => _TropicalFruitsState();
}

class _TropicalFruitsState extends State<TropicalFruits> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 263, crossAxisSpacing: 2, mainAxisSpacing: 2),
      itemCount: tropicalFruits.length,
      itemBuilder: (context, index) {
        return HomeScreenGridItem(
          networkImage: tropicalFruits[index]["image"][0],
          productName: tropicalFruits[index]["name"],
          productType: tropicalFruits[index]["type"],
          price: tropicalFruits[index]["price"],
          details: tropicalFruits[index]["details"],
          imageCount: tropicalFruits[index]["image"].length,
          imagesForSlider: tropicalFruits[index]["image"],
        );
      },
    );
  }
}
