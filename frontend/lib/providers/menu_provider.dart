import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/product_model.dart';

List<ProductModel> testMenu = [
  ProductModel(productName: "Adobo", productID: 1),
  ProductModel(productName: "Putangina", productID: 2),
  ProductModel(productName: "Deputa", productID: 3),
  ProductModel(productName: "HAHAHAHA", productID: 4),
];

final menuProvider = Provider((ref) {
  return testMenu;
});