import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(): super(CategoryState(isLoading: true,DetailCategory: []));
  void loadDetailCategory() async {
    emit(state.copyWith(isLoading:true));
    await Future.delayed(Duration(seconds: 3));

  final detail =[
    Category(image: "image/rau.png", name: "Frash Fruits \n& Vegetable", color: Colors.greenAccent,colorradius: Colors.green),
    Category(image: "image/dau1.png", name: "Cooking Oil \n& Ghee", color: Colors.orangeAccent,colorradius: Colors.orange),
    Category(image: "image/ca.png", name: "Meat & Fish", color: Colors.redAccent,colorradius: Colors.red),
    Category(image: "image/banhmy.png", name: "Bakery & Snack", color: Colors.deepPurple,colorradius: Colors.purple),
    Category(image: "image/sua.png", name: " Dairy & Eggs", color: Colors.yellowAccent,colorradius: Colors.yellow),
    Category(image: "image/nuocngot.png", name: "Beverages", color: Colors.lightBlue,colorradius: Colors.blue),
    Category(image: "image/rau.png", name: "Beverages", color: Colors.deepOrangeAccent,colorradius: Colors.deepOrange),
    Category(image: "image/rau.png", name: "Beverages", color: Colors.pink,colorradius: Colors.pinkAccent),
    Category(image: "image/rau.png", name: "Beverages", color: Colors.greenAccent,colorradius: Colors.green),
    Category(image: "image/rau.png", name: "Beverages", color: Colors.greenAccent,colorradius: Colors.green),
    Category(image: "image/rau.png", name: "Beverages", color: Colors.greenAccent,colorradius: Colors.green),

  ];

  emit(state.copyWith(
    DetailCategory: detail,
    isLoading: false,
  ));
  }
  void simulateClickLoading(String name) async {
    emit(state.copyWith(isLoadingitem: true));
    print(name);
    await Future.delayed(Duration(seconds: 3));
    emit(state.copyWith(isLoadingitem: false));
  }
}
