import 'package:flutter/material.dart';
import 'package:mini_ui_project/constan/appColors.dart';
import 'package:mini_ui_project/data/recomendedProduct.dart';
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
          TopBar(text: "Text"),
          TabBar(
            controller: _tabController,
            tabs: [
              Tab(
                text: "Text",
              ),
              Tab(
                text: "Text",
              ),
              Tab(
                text: "Text",
              ),
            ],
            unselectedLabelColor: AppColors.black100,
            labelColor: AppColors.black1,
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(90),
                color: AppColors.yellow),
          ),
          Expanded(child: TabBarView(controller: _tabController, children: []))
        ],
      ),
    ));
  }
}
