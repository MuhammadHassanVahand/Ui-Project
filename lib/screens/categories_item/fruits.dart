import 'package:flutter/material.dart';
import 'package:mini_ui_project/constan/appColors.dart';
import 'package:mini_ui_project/widget/appTopContainer.dart';

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
                children: [],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
