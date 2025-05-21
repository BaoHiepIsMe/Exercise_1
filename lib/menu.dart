import 'package:flutter/material.dart';
import "homepage.dart";
import "category.dart";
import "account.dart";

List<String> titles = <String>[
  'Shop',
  'Explore',
  'Cart',
  'Favorite',
  'Account'
];

void main() {
  runApp(const TabBarDemo());
}

class TabBarDemo extends StatelessWidget {
  const TabBarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(colorSchemeSeed: Colors.green),
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          body: const TabBarView(
            children: [
              Homepage(),
              Category(),
              Center(child: Text('Cart')),
              Center(child: Text('Favorite')),
              ProfileScreen(),
            ],
          ),
          bottomNavigationBar: Material(
            child: TabBar(
              labelPadding: EdgeInsets.zero, // Xoá khoảng cách thừa
              tabs: [
                _buildTab(Icons.storefront, titles[0]),
                _buildTab(Icons.manage_search, titles[1]),
                _buildTab(Icons.shopping_cart_outlined, titles[2]),
                _buildTab(Icons.favorite_border, titles[3]),
                _buildTab(Icons.person_outline_sharp, titles[4]),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Tab _buildTab(IconData icon, String title) {
    return Tab(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 25),
          Text(title, style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
