import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: CircularProgressIndicator(
          color: Colors.lightGreen, // hoặc Colors.green, Colors.blue...
          strokeWidth: 4.0,    // độ dày vòng xoay
        ), // vòng tròn xoay
      ),
    );
  }
}
