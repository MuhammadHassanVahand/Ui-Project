import 'package:flutter/material.dart';
import 'package:mini_ui_project/constan/appColors.dart';
import 'package:mini_ui_project/data/chineseFood.dart';
import 'package:mini_ui_project/widget/appTopContainer.dart';
import 'package:mini_ui_project/widget/home_screen_searchbar.dart';

class ChineseFood extends StatefulWidget {
  const ChineseFood({super.key});

  @override
  State<ChineseFood> createState() => _ChineseFoodState();
}

class _ChineseFoodState extends State<ChineseFood>
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
            TopBar(text: "Chinese Food"),
            TabBar(
              controller: _tabController,
              tabs: [
                Tab(
                  text: "Dim Sum",
                ),
                Tab(
                  text: "Sichuan Cuisine",
                ),
                Tab(
                  text: "Cantonese Cuisine",
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
                  DimSum(),
                  SichuanCuisine(),
                  CantoneseCuisine(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DimSum extends StatefulWidget {
  const DimSum({super.key});

  @override
  State<DimSum> createState() => _DimSumState();
}

class _DimSumState extends State<DimSum> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 263, crossAxisSpacing: 2, mainAxisSpacing: 2),
      itemCount: dimSum.length,
      itemBuilder: (context, index) {
        return HomeScreenGridItem(
          networkImage: dimSum[index]["image"][0],
          productName: dimSum[index]["name"],
          productType: dimSum[index]["type"],
          price: dimSum[index]["price"],
          details: dimSum[index]["details"],
          imageCount: dimSum[index]["image"].length,
          imagesForSlider: dimSum[index]["image"],
        );
      },
    );
  }
}

class SichuanCuisine extends StatefulWidget {
  const SichuanCuisine({super.key});

  @override
  State<SichuanCuisine> createState() => _SichuanCuisineState();
}

class _SichuanCuisineState extends State<SichuanCuisine> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 263, crossAxisSpacing: 2, mainAxisSpacing: 2),
      itemCount: sichuanCuisine.length,
      itemBuilder: (context, index) {
        return HomeScreenGridItem(
          networkImage: sichuanCuisine[index]["image"][0],
          productName: sichuanCuisine[index]["name"],
          productType: sichuanCuisine[index]["type"],
          price: sichuanCuisine[index]["price"],
          details: sichuanCuisine[index]["details"],
          imageCount: sichuanCuisine[index]["image"].length,
          imagesForSlider: sichuanCuisine[index]["image"],
        );
      },
    );
  }
}

class CantoneseCuisine extends StatefulWidget {
  const CantoneseCuisine({super.key});

  @override
  State<CantoneseCuisine> createState() => _CantoneseCuisineState();
}

class _CantoneseCuisineState extends State<CantoneseCuisine> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 263, crossAxisSpacing: 2, mainAxisSpacing: 2),
      itemCount: cantoneseCuisine.length,
      itemBuilder: (context, index) {
        return HomeScreenGridItem(
          networkImage: cantoneseCuisine[index]["image"][0],
          productName: cantoneseCuisine[index]["name"],
          productType: cantoneseCuisine[index]["type"],
          price: cantoneseCuisine[index]["price"],
          details: cantoneseCuisine[index]["details"],
          imageCount: cantoneseCuisine[index]["image"].length,
          imagesForSlider: cantoneseCuisine[index]["image"],
        );
      },
    );
  }
}
