import 'product.dart';

class HomeState {
  final List<Product> exclusiveProducts;
  final List<Product> bestSellingProducts;
  final List<Product> productAll;
  final bool isLoading;

  HomeState({
    required this.exclusiveProducts,
    required this.bestSellingProducts,
    required this.productAll,
    this.isLoading = true,
  });

  HomeState copyWith({
    List<Product>? exclusiveProducts,
    List<Product>? bestSellingProducts,
    List<Product>? productAll,
    bool? isLoading,
  }) {
    return HomeState(
      exclusiveProducts: exclusiveProducts ?? this.exclusiveProducts,
      bestSellingProducts: bestSellingProducts ?? this.bestSellingProducts,
      productAll: productAll ?? this.productAll,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  factory HomeState.initial() {
    return HomeState(
      exclusiveProducts: [],
      bestSellingProducts: [],
      productAll: [],
      isLoading: true,
    );
  }
}

