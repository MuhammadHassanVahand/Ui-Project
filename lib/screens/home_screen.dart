import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mini_ui_project/constan/appColors.dart';
import 'package:mini_ui_project/screens/categories.dart';
import 'package:mini_ui_project/screens/favourite.dart';
import 'package:mini_ui_project/screens/home.dart';
import 'package:mini_ui_project/screens/moreOption.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectIndex = 0;

  List _screen = [
    Home(),
    Catedories(),
    Favourite(),
    MoreOptions(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screen[_selectIndex],
      bottomNavigationBar: CurvedNavigationBar(
        height: 55,
        color: AppColors.black20,
        animationCurve: Curves.decelerate,
        animationDuration: Duration(milliseconds: 300),
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: AppColors.black100,
        onTap: (index) {
          setState(() {
            _selectIndex = index;
          });
        },
        items: [
          Icon(
            Icons.home,
            color: AppColors.iconcolor,
          ),
          Icon(
            Icons.category_outlined,
            color: AppColors.iconcolor,
          ),
          Icon(
            Icons.favorite,
            color: AppColors.iconcolor,
          ),
          Icon(
            Icons.more_vert_outlined,
            color: AppColors.iconcolor,
          ),
        ],
      ),
    );
  }
}


















// BottomNavigationBar(
        //   currentIndex: _selectIndex,
        //   onTap: (index) {
        //     setState(() {
        //       _selectIndex = index;
        //     });
        //   },
        //   selectedIconTheme: const IconThemeData(color: Colors.black, size: 30),
        //   selectedItemColor: Colors.blue,
        //   items: const [
        //     BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        //     BottomNavigationBarItem(
        //         icon: Icon(Icons.category_outlined), label: "Category"),
        //     BottomNavigationBarItem(
        //         icon: Icon(Icons.favorite), label: "Favorite"),
        //   ],
        // ),