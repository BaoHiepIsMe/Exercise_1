import 'package:flutter_bloc/flutter_bloc.dart';
import 'homepage_state.dart';
import 'product.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState(isLoading: true,exclusiveProducts: [], bestSellingProducts: [],productAll: []));

  void loadProducts() async {
  emit(state.copyWith(isLoading: true));
  await Future.delayed(Duration(seconds: 5));

  final exclusive = [
    Product(name: "Organic Banana", imageUrl: "image/chuoi.png",much:"7pcs, Prices", price: 4.9),
    Product(name: "Red Apple", imageUrl: "image/tao.png",much: "1kg, Prices", price: 4.9),
    Product(name: "Grape", imageUrl: "image/nho.png",much: "1pcs, Prices", price: 4.9),

  ];

  final bestSelling = [
    Product(name: "Bell Pepper Red", imageUrl: "image/otchuong.png",much: "1kg, Prices", price: 4.9),
    Product(name: "Ginger", imageUrl: "image/OIP.jpg", much: "250grm, Prices",price: 4.9),
    Product(name: "Grape", imageUrl: "image/nho.png", much: "1pcs, Prices",price: 4.9),
  ];
  final productAll = [
    Product(name: "Beef Bone", imageUrl: "image/thitbo.png",much: "1kg, Prices", price: 4.9),
    Product(name: "Chicken", imageUrl: "image/ga-nguyen-con-nhap-khau.png", much: "250grm, Prices",price: 4.9),
    Product(name: "Grape", imageUrl: "image/nho.png", much: "1pcs, Prices",price: 4.9),
  ];

  emit(state.copyWith(
    exclusiveProducts: exclusive,
    bestSellingProducts: bestSelling,
    productAll: productAll,
    isLoading: false,
  ));
}

}
