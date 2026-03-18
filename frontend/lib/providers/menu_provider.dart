import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/menu_model.dart';

List<MenuModel> testMenu = [
  MenuModel(label: "Adobo"),
  MenuModel(label: "Putangina"),
  MenuModel(label: "Deputa"),
  MenuModel(label: "HAHAHAHA"),
];

final menuProvider = Provider((ref) {
  return testMenu;
});