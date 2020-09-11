import 'package:flutter/material.dart';
import 'package:order_meal/page/home.dart';
import 'package:order_meal/page/order.dart';
import 'package:order_meal/page/user.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Order Meal',
      routes: {
        '/': (context) => Home(menuIndex: 0),
        '/order': (context) => Order(menuIndex: 1),
        '/user': (context) => User(menuIndex: 2),
      },
    );
  }
}


