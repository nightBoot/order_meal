import 'package:flutter/material.dart';
import 'package:order_meal/component/bottomNav.dart';

class User extends StatelessWidget {
  User({this.menuIndex});
  final int menuIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的'),
      ),
      body: Center(
        child: Text('用户详细'),
      ),
      bottomNavigationBar: BottomNav(menuIndex: menuIndex),
    );
  }
}