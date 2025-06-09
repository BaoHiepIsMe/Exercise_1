import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/cart_page/model_cart.dart';

import 'cart_state.dart';
class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState(
    itemCategories: [],
    items: [],
    cartItems: {},
  )) {
    loadFoodTypes();
    loadItem();
  }

  List<Item> allItems = [];

  void loadFoodTypes() {
    // Fake data / API call
    final types = [
      ItemCategory("image/rau.png", "Fruit & Vegetable", "High In Vitamins (Especially Vitamin C And Folate), Dietary Fiber And Various Antioxidants. Support Immune Fuction, Aid Digestion, And Help Reduce Chronic-Disease Risk. Rich In Fiber, Vitamin A, K, Folate, And Minerals Like Potassium And Magnesium.","fruit"),
      ItemCategory( "image/ca.png",  "Meat & Fish","High In Vitamins (Especially Vitamin C And Folate), Dietary Fiber And Various Antioxidants. Support Immune Fuction, Aid Digestion, And Help Reduce Chronic-Disease Risk. Rich In Fiber, Vitamin A, K, Folate, And Minerals Like Potassium And Magnesium.","meat"),
      ItemCategory( "image/sua.png", "Dairy & Egg","High In Vitamins (Especially Vitamin C And Folate), Dietary Fiber And Various Antioxidants. Support Immune Fuction, Aid Digestion, And Help Reduce Chronic-Disease Risk. Rich In Fiber, Vitamin A, K, Folate, And Minerals Like Potassium And Magnesium.","dairy"),
      ItemCategory( "image/day1.png", "Oil","High In Vitamins (Especially Vitamin C And Folate), Dietary Fiber And Various Antioxidants. Support Immune Fuction, Aid Digestion, And Help Reduce Chronic-Disease Risk. Rich In Fiber, Vitamin A, K, Folate, And Minerals Like Potassium And Magnesium.","oil"),
      ItemCategory( "image/banhmy.png", "Bakery","High In Vitamins (Especially Vitamin C And Folate), Dietary Fiber And Various Antioxidants. Support Immune Fuction, Aid Digestion, And Help Reduce Chronic-Disease Risk. Rich In Fiber, Vitamin A, K, Folate, And Minerals Like Potassium And Magnesium.","bakery"),
      ItemCategory( "image/nuocngot.png",  "Beverage","High In Vitamins (Especially Vitamin C And Folate), Dietary Fiber And Various Antioxidants. Support Immune Fuction, Aid Digestion, And Help Reduce Chronic-Disease Risk. Rich In Fiber, Vitamin A, K, Folate, And Minerals Like Potassium And Magnesium.","beverage"),
    ];

    emit(state.copyWith(itemCategories: types));
  }

  void loadItem(){
    final getItem =[
      Item("Banana", 4.9, "image/chuoi.png","fruit"),
      Item("Apple", 4.9, "image/tao.png","fruit"),
      Item("Bell Pepper", 4.9, "image/tao.png","fruit"),
      Item("Ginger", 4.9, "image/tao.png","fruit"),
      Item("Bean", 4.9, "image/","fruit"),
      Item("Chicken", 4.9, "image/ga-nguyen-con-nhap-khau.png","meat"),
      Item("Fish", 4.9, "image/tao.png","meat"),
      Item("Cow", 4.9, "image/tao.png","meat"),
      Item("Pig", 4.9, "image/tao.png","meat"),
      Item("Bird", 4.9, "image/tao.png","meat"),
      Item("Egg chicken", 4.9, "image/","dairy"),
      Item("Egg Duck", 4.9, "image/tao.png","dairy"),
      Item("Milk Cow", 4.9, "image/tao.png","dairy"),
      Item("Milk Goat", 4.9, "image/tao.png","dairy"),
      Item("Milk Vitamin", 4.9, "image/tao.png","dairy"),
      Item("Soy oil", 4.9, "image/tao.png","oil"),
      Item("Sunflower seed oil", 4.9, "image/tao.png","oil"),
      Item("Olive oil", 4.9, "image/tao.png","oil"),
      Item("Sesame oil ", 4.9, "image/tao.png","oil"),
      Item("Peanut oil", 4.9, "image/tao.png","oil"),
      Item("Crepe", 4.9, "image/tao.png","bakery"),
      Item("Pancake", 4.9, "image/tao.png","bakery"),
      Item("Pastry", 4.9, "image/tao.png","bakery"),
      Item("Biscuit", 4.9, "image/tao.png","bakery"),
      Item("Sweet bread", 4.9, "image/tao.png","bakery"),
      Item("Fruit Orange", 4.9, "image/tao.png","beverage"),
      Item("Water", 4.9, "image/tao.png","beverage"),
      Item("7up", 4.9, "image/tao.png","beverage"),
      Item("Pepsi", 4.9, "image/tao.png","beverage"),
      Item("Coca", 4.9, "image/tao.png","beverage"),
    ];
    allItems =getItem;
    
  }

  void selectItemFromCategory(String category) {
  final filtered = allItems.where((item) => item.category == category).toList();
  emit(state.copyWith(items: filtered));
}




  void addItemToCart(Item item) {
    final current = Map<Item, int>.from(state.cartItems);
    current[item] = (current[item] ?? 0) + 1;
    emit(state.copyWith(cartItems: current));
  }

  void removeItemFromCart(Item item) {
    final current = Map<Item, int>.from(state.cartItems);
    if (current.containsKey(item)) {
      if (current[item]! > 1) {
        current[item] = current[item]! - 1;
      } else {
        current.remove(item);
      }
      emit(state.copyWith(cartItems: current));
    }
  }
}
