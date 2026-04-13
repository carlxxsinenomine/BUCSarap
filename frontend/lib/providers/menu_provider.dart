import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/product_model.dart';

List<ProductModel> testMenu = [
  ProductModel(productName: "Adobo", productID: 1, productPrice: 1),
  ProductModel(productName: "Putangina", productID: 2, productPrice: 3),
  ProductModel(productName: "Deputa", productID: 3, productPrice: 6),
  ProductModel(productName: "HAHAHAHA", productID: 4, productPrice: 19),
  ProductModel(productName: "Adobo", productID: 1, productPrice: 1),
  ProductModel(productName: "Putangina", productID: 2, productPrice: 3),
  ProductModel(productName: "Deputa", productID: 3, productPrice: 6),
  ProductModel(productName: "HAHAHAHA", productID: 4, productPrice: 19),
];

final menuProvider = Provider((ref) {
  return testMenu;
});