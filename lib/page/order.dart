import 'package:flutter/material.dart';
import 'package:order_meal/component/bottomNav.dart';

class Order extends StatelessWidget {
  Order({this.menuIndex});
  final int menuIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('订单'),
      ),
      body: Center(
        child: Text('订单详细'),
      ),
      bottomNavigationBar: BottomNav(menuIndex: menuIndex),
    );
  }
}