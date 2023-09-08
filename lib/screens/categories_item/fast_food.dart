import 'package:flutter/material.dart';
import 'package:mini_ui_project/constan/appColors.dart';
import 'package:mini_ui_project/widget/appTopContainer.dart';

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
              labelColor: AppColors.black1,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(90),
                  color: AppColors.yellow),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
