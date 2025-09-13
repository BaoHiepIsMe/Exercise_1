import 'model_cart.dart';
class CartState {
  final bool isExpanded;
  final bool isChoseProduct;
  final bool isProduct;
  final List<ItemCategory> itemCategories;
  final ItemCategory? selectedCategory;
  final String? nameCategory;
  final String? categoryDetail; 
  final String? select;// Thông tin chi tiết
  final List<Item> items; // Các item tương ứng với category
  final Map<Item, int> cartItems; // Item trong giỏ: số lượng từng item

  CartState({

    required this.itemCategories,
    this.selectedCategory,
    this.categoryDetail,
    required this.items,
    required this.cartItems,
    this.select,
    this.nameCategory,
    this.isExpanded = true,
    this.isProduct = true,
    this.isChoseProduct = true,
  });

  CartState copyWith({
    List<ItemCategory>? itemCategories,
    List<Item>? items,
    Map<Item, int>? cartItems, 
    String? nameCategory,
    String? categoryDetail, 
    String? select,
    bool? isExpanded,
    bool? isProduct,
    bool? isChoseProduct

  }) {
    return CartState(
      itemCategories: itemCategories ?? this.itemCategories,
      items: items ?? this.items,
      cartItems: cartItems ?? this.cartItems,
      isExpanded: isExpanded ?? this.isExpanded,
      isProduct: isProduct ?? this.isProduct,
      isChoseProduct: isChoseProduct ?? this.isChoseProduct,
      categoryDetail: categoryDetail ?? this.categoryDetail,
      nameCategory: nameCategory ?? this.nameCategory,
      select: select ?? this.select,

    );
  }
  

}