import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  BottomNav({this.menuIndex});
  final int menuIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: menuIndex,
      onTap: (int index) {
        if (index == 0) {
          Navigator.pushNamed(context, '/');
        } else if (index == 1) {
          Navigator.pushNamed(context, '/order');
        } else if (index == 2) {
          Navigator.pushNamed(context, '/user');
        }
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.fastfood),
          title: Text('点餐'),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.assignment,
          ),
          title: Text('订单'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.perm_identity),
          title: Text('我的'),
        ),
      ],
    );
  }
}

