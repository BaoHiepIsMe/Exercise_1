import 'package:flutter/material.dart';
import "package:flutter_bloc/flutter_bloc.dart";
import "package:login/account_page/account_cubit.dart";
import "package:login/cart_page/cart.dart";
import "package:login/cart_page/cart_cubit.dart";
import "package:login/category_page/category_cubit.dart";
import "package:login/homepage/homepage_cubit.dart";
import "homepage/homepage.dart";
import "category_page/category.dart";
import "account_page/account.dart";

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
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeCubit>(
          create: (_) => HomeCubit()..loadProducts(),
        ),
        BlocProvider<CategoryCubit>(
          create: (_) => CategoryCubit()..loadDetailCategory(),
        ),
        BlocProvider<UserCubit>(
          create: (_) => UserCubit()..loadUser()),
        BlocProvider<CartCubit>(
          create: (_) => CartCubit()),
    ], 
    child: MaterialApp(
      theme: ThemeData(colorSchemeSeed: Colors.green),
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          body: TabBarView(
            children: [
              const Homepage(),      
              const Category(),
              const Cart(),
              const Center(child: Text('Favorite')),
              const ProfileScreen(),
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
      )
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
