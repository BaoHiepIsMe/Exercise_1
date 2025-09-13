import 'package:login/cart_page/model_cart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/cart_page/cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState(
    itemCategories: [],
    items: [],
    cartItems: {},
    isExpanded: false,
    isProduct: false,
    isChoseProduct: false,
  )) {
    loadFoodTypes();
    loadItem();
  }

  List<Item> allItems = [];

  void loadFoodTypes() {
    // Fake data / API call
    final types = [
      ItemCategory("image/rau.png", "Fruit & Vegetable", "High In Vitamins (Especially Vitamin C And Folate), Dietary Fiber And Various Antioxidants. Support Immune Fuction, Aid Digestion, And Help Reduce Chronic-Disease Risk. Rich In Fiber, Vitamin A, K, Folate, And Minerals Like Potassium And Magnesium.","fruit"),
      ItemCategory("image/ca.png",  "Meat & Fish","High In Vitamins (Especially Vitamin C And Folate), Dietary Fiber And Various Antioxidants. Support Immune Fuction, Aid Digestion, And Help Reduce Chronic-Disease Risk. Rich In Fiber, Vitamin A, K, Folate, And Minerals Like Potassium And Magnesium.","meat"),
      ItemCategory("image/sua.png", "Dairy & Egg","High In Vitamins (Especially Vitamin C And Folate), Dietary Fiber And Various Antioxidants. Support Immune Fuction, Aid Digestion, And Help Reduce Chronic-Disease Risk. Rich In Fiber, Vitamin A, K, Folate, And Minerals Like Potassium And Magnesium.","dairy"),
      ItemCategory("image/dau1.png", "Oil","High In Vitamins (Especially Vitamin C And Folate), Dietary Fiber And Various Antioxidants. Support Immune Fuction, Aid Digestion, And Help Reduce Chronic-Disease Risk. Rich In Fiber, Vitamin A, K, Folate, And Minerals Like Potassium And Magnesium.","oil"),
      ItemCategory("image/banhmy.png", "Bakery","High In Vitamins (Especially Vitamin C And Folate), Dietary Fiber And Various Antioxidants. Support Immune Fuction, Aid Digestion, And Help Reduce Chronic-Disease Risk. Rich In Fiber, Vitamin A, K, Folate, And Minerals Like Potassium And Magnesium.","bakery"),
      ItemCategory("image/nuocngot.png",  "Beverage","High In Vitamins (Especially Vitamin C And Folate), Dietary Fiber And Various Antioxidants. Support Immune Fuction, Aid Digestion, And Help Reduce Chronic-Disease Risk. Rich In Fiber, Vitamin A, K, Folate, And Minerals Like Potassium And Magnesium.","beverage"),
    ];
    emit(state.copyWith(itemCategories: types,));
  }

  void loadItem() {
    final getItem = [
      Item("Banana","image/chuoi.png", 4.9, "fruit"),
      Item("Apple","image/tao.png", 4.9, "fruit"),
      Item("Bell Pepper","image/tao.png", 4.9, "fruit"),
      Item("Ginger","image/tao.png", 4.9, "fruit"),
      Item("Bean","image/tao.png", 4.9, "fruit"),
      Item("Chicken","image/ga-nguyen-con-nhap-khau.png", 4.9, "meat"),
      Item("Fish","image/tao.png", 4.9, "meat"),
      Item("Cow","image/tao.png", 4.9, "meat"),
      Item("Pig","image/tao.png", 4.9, "meat"),
      Item("Bird","image/tao.png", 4.9, "meat"),
      Item("Egg chicken","image/tao.png", 4.9, "dairy"),
      Item("Egg Duck","image/tao.png", 4.9, "dairy"),
      Item("Milk Cow","image/tao.png", 4.9, "dairy"),
      Item("Milk Goat","image/tao.png", 4.9, "dairy"),
      Item("Milk Vitamin","image/tao.png", 4.9, "dairy"),
      Item("Soy oil","image/tao.png", 4.9, "oil"),
      Item("Sunflower seed oil","image/tao.png", 4.9, "oil"),
      Item("Olive oil","image/tao.png", 4.9, "oil"),
      Item("Sesame oil","image/tao.png", 4.9, "oil"),
      Item("Peanut oil","image/tao.png", 4.9, "oil"),
      Item("Crepe","image/tao.png", 4.9, "bakery"),
      Item("Pancake","image/tao.png", 4.9, "bakery"),
      Item("Pastry","image/tao.png", 4.9, "bakery"),
      Item("Biscuit","image/tao.png", 4.9, "bakery"),
      Item("Sweet bread","image/tao.png", 4.9, "bakery"),
      Item("Fruit Orange","image/tao.png", 4.9, "beverage"),
      Item("Water","image/tao.png", 4.9, "beverage"),
      Item("7up","image/tao.png", 4.9, "beverage"),
      Item("Pepsi","image/tao.png", 4.9, "beverage"),
      Item("Coca","image/tao.png", 4.9, "beverage"),
    ];
    allItems = getItem;
  }

   void toggleExpanded() {
      print("Toggling from ${state.isExpanded} to ${!state.isExpanded}");
    emit(state.copyWith(isExpanded: !state.isExpanded));
  }

   void toggleProduct() {
    emit(state.copyWith(isProduct: true));
  }

  void toggleChoseProduct() {
      print("Toggling from ${state.isChoseProduct} to ${!state.isChoseProduct}");
    emit(state.copyWith(isChoseProduct: !state.isChoseProduct));
  }

  void selectItemFromCategory(String category) {
  final filtered = allItems.where((item) => item.category == category).toList();
  emit(state.copyWith(items: filtered));
  }
 
  void getCategoryInformation(String name, String info) {
  emit(state.copyWith(
    nameCategory: name,
    categoryDetail: info
  ));
  }
  void saveSelect(String select) {
  emit(state.copyWith(
    select: select,
  ));
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
