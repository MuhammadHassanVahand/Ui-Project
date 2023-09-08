import 'package:flutter/material.dart';
import 'package:mini_ui_project/constan/appColors.dart';
import 'package:mini_ui_project/data/vegetables.dart';
import 'package:mini_ui_project/widget/appTopContainer.dart';
import 'package:mini_ui_project/widget/home_screen_searchbar.dart';

class Vegetables extends StatefulWidget {
  const Vegetables({super.key});

  @override
  State<Vegetables> createState() => _VegetablesState();
}

class _VegetablesState extends State<Vegetables>
    with SingleTickerProviderStateMixin {
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
            TopBar(text: "Vegetables"),
            TabBar(
              controller: _tabController,
              tabs: [
                Tab(
                  text: "Leafy Green",
                ),
                Tab(
                  text: "Root Vegetables",
                ),
                Tab(
                  text: "CruciferousVegetables",
                ),
              ],
              unselectedLabelColor: AppColors.black100,
              labelPadding: EdgeInsets.symmetric(horizontal: 8),
              labelColor: AppColors.black1,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(90),
                color: AppColors.yellow,
                border: Border.all(
                  color: AppColors.black100,
                ),
              ),
            ),
            Expanded(
                child: TabBarView(controller: _tabController, children: [
              LeafyGreens(),
              RootVegetables(),
              CruciferousVegetables(),
            ]))
          ],
        ),
      ),
    );
  }
}

class LeafyGreens extends StatefulWidget {
  const LeafyGreens({super.key});

  @override
  State<LeafyGreens> createState() => _LeafyGreensState();
}

class _LeafyGreensState extends State<LeafyGreens> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 263, crossAxisSpacing: 2, mainAxisSpacing: 2),
      itemCount: leafyGreens.length,
      itemBuilder: (context, index) {
        return HomeScreenGridItem(
          networkImage: leafyGreens[index]["image"][0],
          productName: leafyGreens[index]["name"],
          productType: leafyGreens[index]["type"],
          price: leafyGreens[index]["price"],
          details: leafyGreens[index]["details"],
          imageCount: leafyGreens[index]["image"].length,
          imagesForSlider: leafyGreens[index]["image"],
        );
      },
    );
  }
}

class RootVegetables extends StatefulWidget {
  const RootVegetables({super.key});

  @override
  State<RootVegetables> createState() => _RootVegetablesState();
}

class _RootVegetablesState extends State<RootVegetables> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 263, crossAxisSpacing: 2, mainAxisSpacing: 2),
      itemCount: rootVegetables.length,
      itemBuilder: (context, index) {
        return HomeScreenGridItem(
          networkImage: rootVegetables[index]["image"][0],
          productName: rootVegetables[index]["name"],
          productType: rootVegetables[index]["type"],
          price: rootVegetables[index]["price"],
          details: rootVegetables[index]["details"],
          imageCount: rootVegetables[index]["image"].length,
          imagesForSlider: rootVegetables[index]["image"],
        );
      },
    );
  }
}

class CruciferousVegetables extends StatefulWidget {
  const CruciferousVegetables({super.key});

  @override
  State<CruciferousVegetables> createState() => _CruciferousVegetablesState();
}

class _CruciferousVegetablesState extends State<CruciferousVegetables> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 263, crossAxisSpacing: 2, mainAxisSpacing: 2),
      itemCount: cruciferousVegetables.length,
      itemBuilder: (context, index) {
        return HomeScreenGridItem(
          networkImage: cruciferousVegetables[index]["image"][0],
          productName: cruciferousVegetables[index]["name"],
          productType: cruciferousVegetables[index]["type"],
          price: cruciferousVegetables[index]["price"],
          details: cruciferousVegetables[index]["details"],
          imageCount: cruciferousVegetables[index]["image"].length,
          imagesForSlider: cruciferousVegetables[index]["image"],
        );
      },
    );
  }
}
