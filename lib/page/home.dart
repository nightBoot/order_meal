import 'package:flutter/material.dart';
import 'package:order_meal/page/meal.dart';
import 'package:order_meal/component/bottomNav.dart';

class Home extends StatelessWidget {
  Home({this.menuIndex});
  final int menuIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('点餐'),
      ),
      body: ProductList(),
      bottomNavigationBar: BottomNav(menuIndex: menuIndex),
    );
  }
}