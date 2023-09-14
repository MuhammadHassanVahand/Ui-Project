import 'package:flutter/material.dart';
import 'package:mini_ui_project/constan/appColors.dart';
import 'package:mini_ui_project/screens/orders/currentOrders.dart';
import 'package:mini_ui_project/screens/orders/pastOrders.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
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
        appBar: AppBar(
          title: Text("Orders"),
          iconTheme: IconThemeData(color: AppColors.black100),
          backgroundColor: AppColors.black1,
          titleTextStyle: TextStyle(color: AppColors.black100, fontSize: 20),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TabBar(
                controller: _tabController,
                tabs: [
                  Tab(
                    text: "Current",
                  ),
                  Tab(
                    text: "Past",
                  ),
                ],
                unselectedLabelColor: AppColors.black100,
                labelColor: AppColors.black1,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(90),
                  color: AppColors.yellow,
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  CurrentOrders(),
                  PastOrders(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
