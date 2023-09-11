import 'package:flutter/material.dart';
import 'package:mini_ui_project/constan/appColors.dart';
import 'package:mini_ui_project/data/fishFood.dart';
import 'package:mini_ui_project/widget/appTopContainer.dart';
import 'package:mini_ui_project/widget/home_screen_searchbar.dart';

class Fishes extends StatefulWidget {
  const Fishes({super.key});

  @override
  State<Fishes> createState() => _FishesState();
}

class _FishesState extends State<Fishes> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  void ontoptUpdated() {
    setState(() {});
  }

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
              ontopUpdated: () {
                setState(() {});
              },
              text: "Sea Food",
            ),
            TabBar(
              controller: _tabController,
              tabs: [
                Tab(
                  text: "Finfish",
                ),
                Tab(
                  text: "Shellfish",
                ),
                Tab(
                  text: "Mollusks",
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
                  Finfish(ontopUpdated: ontoptUpdated),
                  Shellfish(ontopUpdated: ontoptUpdated),
                  Mollusks(ontopUpdated: ontoptUpdated),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Finfish extends StatefulWidget {
  final Function? ontopUpdated;
  const Finfish({super.key, this.ontopUpdated});

  @override
  State<Finfish> createState() => _FinfishState();
}

class _FinfishState extends State<Finfish> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 263, crossAxisSpacing: 2, mainAxisSpacing: 2),
      itemCount: finfish.length,
      itemBuilder: (context, index) {
        return HomeScreenGridItem(
          networkImage: finfish[index]["image"][0],
          productName: finfish[index]["name"],
          productType: finfish[index]["type"],
          price: finfish[index]["price"],
          details: finfish[index]["details"],
          imageCount: finfish[index]["image"].length,
          imagesForSlider: finfish[index]["image"],
          ontopUpdated: widget.ontopUpdated,
        );
      },
    );
  }
}

class Shellfish extends StatefulWidget {
  final Function? ontopUpdated;
  const Shellfish({super.key, this.ontopUpdated});

  @override
  State<Shellfish> createState() => _ShellfishState();
}

class _ShellfishState extends State<Shellfish> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 263, crossAxisSpacing: 2, mainAxisSpacing: 2),
      itemCount: shellfish.length,
      itemBuilder: (context, index) {
        return HomeScreenGridItem(
          networkImage: shellfish[index]["image"][0],
          productName: shellfish[index]["name"],
          productType: shellfish[index]["type"],
          price: shellfish[index]["price"],
          details: shellfish[index]["details"],
          imageCount: shellfish[index]["image"].length,
          imagesForSlider: shellfish[index]["image"],
          ontopUpdated: widget.ontopUpdated,
        );
      },
    );
  }
}

class Mollusks extends StatefulWidget {
  final Function? ontopUpdated;
  const Mollusks({super.key, this.ontopUpdated});

  @override
  State<Mollusks> createState() => _MollusksState();
}

class _MollusksState extends State<Mollusks> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 263, crossAxisSpacing: 2, mainAxisSpacing: 2),
      itemCount: mollusks.length,
      itemBuilder: (context, index) {
        return HomeScreenGridItem(
          networkImage: mollusks[index]["image"][0],
          productName: mollusks[index]["name"],
          productType: mollusks[index]["type"],
          price: mollusks[index]["price"],
          details: mollusks[index]["details"],
          imageCount: mollusks[index]["image"].length,
          imagesForSlider: mollusks[index]["image"],
          ontopUpdated: widget.ontopUpdated,
        );
      },
    );
  }
}
