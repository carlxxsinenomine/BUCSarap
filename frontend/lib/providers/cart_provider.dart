import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/models/product_pile_model.dart';

class CartNotifier extends Notifier<Set<ProductPile>> {

  @override
  Set<ProductPile> build() {
    return const {};
  }

  void addProduct(ProductPile product) {
    if (!state.contains(product)) {
      for (var prod in state) {
        if (prod.productID == product.productID) {
          // Walang internet pota diko alam pano baguhin obj from a set
          // Kaya hanap nlng alternative
          // Update: this shit works HAHAHAHAHAHAHAHA
          int prodQuantity = prod.quantity!;
          removeProduct(prod);
          state = {
            ...state,
            ProductPile(
              productID: product.productID,
              productPileID: product.productPileID,
              stallID: product.stallID,
              quantity: (product.quantity! + prodQuantity),
            ),
          };
          return;
        }
      }
      state = {...state, product};
    }
  }

  ProductPile getProduct(int productID) {
    return state.where((prod) => prod.productID == productID).first;
  }

  void decrementProduct(ProductPile product) {
    if(product.quantity! > 0 && state.contains(product)) {
      for (var prod in state) {
        if (prod.productID == product.productID) {
          // Putang talino kong hayup
          removeProduct(prod);
          state = {
            ...state,
            ProductPile(
              productID: product.productID,
              productPileID: product.productPileID,
              stallID: product.stallID,
              quantity: (product.quantity! - 1),
            ),
          };

          var current = state.toList();

          for (int i = 0; i < current.length; i++) {
            for (int j =  i; j < current.length - 1; j++) {
              if (current[i].productID! > current[j + 1].productID!) {
                ProductPile temp = current[i];
                current[i] = current[j + 1];
                current[j + 1] = temp;
              }
            }
          }
          state = current.toSet();
          return;
        }
      }
    }
  }

  void incrementProduct(ProductPile product) {

  }

  void removeProduct(ProductPile product) {
    if (state.contains(product)) {
      state = state
          .where((prod) => prod.productID != product.productID)
          .toSet();
    }
  }
}

final cartNotifierProvider = NotifierProvider<CartNotifier, Set<ProductPile>>(
  () {
    return CartNotifier();
  },
);
