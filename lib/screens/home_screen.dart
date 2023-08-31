import 'package:flutter/material.dart';
import 'package:mini_ui_project/screens/categories.dart';
import 'package:mini_ui_project/screens/favourite.dart';
import 'package:mini_ui_project/screens/home.dart';

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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screen[_selectIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectIndex,
        onTap: (index) {
          setState(() {
            _selectIndex = index;
          });
        },
        selectedIconTheme: const IconThemeData(color: Colors.black, size: 30),
        selectedItemColor: Colors.blue,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.category_outlined), label: "Category"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Favorite"),
        ],
      ),
    );
  }
}
