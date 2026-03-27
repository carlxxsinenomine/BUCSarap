import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/models/product_pile_model.dart';

class CartNotifier extends Notifier<Set<ProductPile>> {
  @override
  Set<ProductPile> build() {
    return const {};
  }

  void addProduct(ProductPile product) {
    if(!state.contains(product)) {
      state = {...state, product};
    }
  }
  
  void removeProduct(ProductPile product) {
    if(state.contains(product)) {
      state = state.where((prod) => prod.productID != product.productID).toSet();
    }
  }
}

final cartNotifierProvider = NotifierProvider<CartNotifier, Set<ProductPile>>(() {
  return CartNotifier();
});

