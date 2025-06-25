import 'package:flutter/material.dart';

class Category{
  final String image;
  final String name;
  final Color color;
  final Color colorradius;

  Category({
    required this.image,
    required this.name,
    required this.color,
    required this.colorradius,

  });
}

class CategoryState {
  final List<Category> DetailCategory;
  final bool isLoading;
  final bool isLoadingitem;
  CategoryState({
    required this.DetailCategory,
    this.isLoading = true,
    this.isLoadingitem = false,
  });

  CategoryState copyWith({
    List<Category>? DetailCategory,
    bool? isLoading,
    bool? isLoadingitem
  }){
    return CategoryState(
      DetailCategory: DetailCategory ?? this.DetailCategory,
      isLoading: isLoading ?? this.isLoading,
      isLoadingitem: isLoadingitem ?? this.isLoadingitem,
      );
  }
  factory CategoryState.initial(){
    return CategoryState(
      DetailCategory: [],
      isLoading: true,
      isLoadingitem: false,
    );
  }
}