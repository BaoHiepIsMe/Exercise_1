import 'model_cart.dart';
class CartState {
  
  final List<ItemCategory> itemCategories;
  final ItemCategory? selectedCategory;

  final String? categoryDetail; // Thông tin chi tiết

  final List<Item> items; // Các item tương ứng với category
  final Map<Item, int> cartItems; // Item trong giỏ: số lượng từng item

  CartState({

    required this.itemCategories,
    this.selectedCategory,
    this.categoryDetail,
    required this.items,
    required this.cartItems,
  });

  CartState copyWith({
    List<ItemCategory>? itemCategories,
    List<Item>? items,
    Map<Item, int>? cartItems,
  }) {
    return CartState(
      itemCategories: itemCategories ?? this.itemCategories,
      items: items ?? this.items,
      cartItems: cartItems ?? this.cartItems,
    );
  }
}
