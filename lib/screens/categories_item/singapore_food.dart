import 'package:flutter/material.dart';
import 'package:mini_ui_project/constan/appColors.dart';
import 'package:mini_ui_project/widget/appTopContainer.dart';

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