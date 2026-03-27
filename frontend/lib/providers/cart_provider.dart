import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/models/product_model.dart';

class CartNotifier extends Notifier<Set<ProductModel>> {
  @override
  Set<ProductModel> build() {
    return const {};
  }

  void addProduct(ProductModel product) {
    if(!state.contains(product)) {
      state = {...state, product};
    }
  }
}

final cartNotifierProvider = NotifierProvider<CartNotifier, Set<ProductModel>>(() {
  return CartNotifier();
});