import 'package:flutter/material.dart';
import 'package:mini_ui_project/constan/appColors.dart';
import 'package:mini_ui_project/data/singapore.dart';
import 'package:mini_ui_project/widget/appTopContainer.dart';
import 'package:mini_ui_project/widget/home_screen_searchbar.dart';

class SingaporeFood extends StatefulWidget {
  const SingaporeFood({super.key});

  @override
  State<SingaporeFood> createState() => _SingaporeFoodState();
}

class _SingaporeFoodState extends State<SingaporeFood>
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
            TopBar(
              text: "Singapore Food",
            ),
            TabBar(
              controller: _tabController,
              tabs: [
                Tab(
                  text: "Hawker Center Delights",
                ),
                Tab(
                  text: "Seafood Specialties",
                ),
                Tab(
                  text: " Desserts and Sweets",
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
                  HawkerCenterDelights(),
                  SeafoodSpecialties(),
                  DessertsandSweets(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HawkerCenterDelights extends StatefulWidget {
  const HawkerCenterDelights({super.key});

  @override
  State<HawkerCenterDelights> createState() => _HawkerCenterDelightsState();
}

class _HawkerCenterDelightsState extends State<HawkerCenterDelights> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 263, crossAxisSpacing: 2, mainAxisSpacing: 2),
      itemCount: hawkerCenterDelights.length,
      itemBuilder: (context, index) {
        return HomeScreenGridItem(
          networkImage: hawkerCenterDelights[index]["image"][0],
          productName: hawkerCenterDelights[index]["name"],
          productType: hawkerCenterDelights[index]["type"],
          price: hawkerCenterDelights[index]["price"],
          details: hawkerCenterDelights[index]["details"],
          imageCount: hawkerCenterDelights[index]["image"].length,
          imagesForSlider: hawkerCenterDelights[index]["image"],
        );
      },
    );
  }
}

class SeafoodSpecialties extends StatefulWidget {
  const SeafoodSpecialties({super.key});

  @override
  State<SeafoodSpecialties> createState() => _SeafoodSpecialtiesState();
}

class _SeafoodSpecialtiesState extends State<SeafoodSpecialties> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 263, crossAxisSpacing: 2, mainAxisSpacing: 2),
      itemCount: seafoodSpecialties.length,
      itemBuilder: (context, index) {
        return HomeScreenGridItem(
          networkImage: seafoodSpecialties[index]["image"][0],
          productName: seafoodSpecialties[index]["name"],
          productType: seafoodSpecialties[index]["type"],
          price: seafoodSpecialties[index]["price"],
          details: seafoodSpecialties[index]["details"],
          imageCount: seafoodSpecialties[index]["image"].length,
          imagesForSlider: seafoodSpecialties[index]["image"],
        );
      },
    );
  }
}

class DessertsandSweets extends StatefulWidget {
  const DessertsandSweets({super.key});

  @override
  State<DessertsandSweets> createState() => _DessertsandSweetsState();
}

class _DessertsandSweetsState extends State<DessertsandSweets> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 263, crossAxisSpacing: 2, mainAxisSpacing: 2),
      itemCount: dessertsandSweets.length,
      itemBuilder: (context, index) {
        return HomeScreenGridItem(
          networkImage: dessertsandSweets[index]["image"][0],
          productName: dessertsandSweets[index]["name"],
          productType: dessertsandSweets[index]["type"],
          price: dessertsandSweets[index]["price"],
          details: dessertsandSweets[index]["details"],
          imageCount: dessertsandSweets[index]["image"].length,
          imagesForSlider: dessertsandSweets[index]["image"],
        );
      },
    );
  }
}
