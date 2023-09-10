import 'package:flutter/material.dart';
import 'package:mini_ui_project/constan/appColors.dart';
import 'package:mini_ui_project/data/fastFood.dart';
import 'package:mini_ui_project/widget/appTopContainer.dart';
import 'package:mini_ui_project/widget/home_screen_searchbar.dart';

class FastFood extends StatefulWidget {
  const FastFood({super.key});

  @override
  State<FastFood> createState() => _FastFoodState();
}

class _FastFoodState extends State<FastFood>
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
              text: "Fast Food",
            ),
            TabBar(
              controller: _tabController,
              tabs: [
                Tab(
                  text: "Burgers",
                ),
                Tab(
                  text: "Pizza",
                ),
                Tab(
                  text: "Fried Chicken",
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
                  Burgers(),
                  Pizza(),
                  FriedChicken(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Burgers extends StatefulWidget {
  const Burgers({super.key});

  @override
  State<Burgers> createState() => _BurgersState();
}

class _BurgersState extends State<Burgers> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 263, crossAxisSpacing: 2, mainAxisSpacing: 2),
      itemCount: burgers.length,
      itemBuilder: (context, index) {
        return HomeScreenGridItem(
          networkImage: burgers[index]["image"][0],
          productName: burgers[index]["name"],
          productType: burgers[index]["type"],
          price: burgers[index]["price"],
          details: burgers[index]["details"],
          imageCount: burgers[index]["image"].length,
          imagesForSlider: burgers[index]["image"],
        );
      },
    );
  }
}

class Pizza extends StatefulWidget {
  const Pizza({super.key});

  @override
  State<Pizza> createState() => _PizzaState();
}

class _PizzaState extends State<Pizza> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 263, crossAxisSpacing: 2, mainAxisSpacing: 2),
      itemCount: pizza.length,
      itemBuilder: (context, index) {
        return HomeScreenGridItem(
          networkImage: pizza[index]["image"][0],
          productName: pizza[index]["name"],
          productType: pizza[index]["type"],
          price: pizza[index]["price"],
          details: pizza[index]["details"],
          imageCount: pizza[index]["image"].length,
          imagesForSlider: pizza[index]["image"],
        );
      },
    );
  }
}

class FriedChicken extends StatefulWidget {
  const FriedChicken({super.key});

  @override
  State<FriedChicken> createState() => _FriedChickenState();
}

class _FriedChickenState extends State<FriedChicken> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 263, crossAxisSpacing: 2, mainAxisSpacing: 2),
      itemCount: friedChicken.length,
      itemBuilder: (context, index) {
        return HomeScreenGridItem(
          networkImage: friedChicken[index]["image"][0],
          productName: friedChicken[index]["name"],
          productType: friedChicken[index]["type"],
          price: friedChicken[index]["price"],
          details: friedChicken[index]["details"],
          imageCount: friedChicken[index]["image"].length,
          imagesForSlider: friedChicken[index]["image"],
        );
      },
    );
  }
}
