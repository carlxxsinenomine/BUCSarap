import 'package:flutter_riverpod/flutter_riverpod.dart';

class MenuModel {
  final String? label;
  const MenuModel({required this.label});
}

List<MenuModel> testMenu = [
  MenuModel(label: "Adobo"),
  MenuModel(label: "Putangina"),
  MenuModel(label: "Deputa"),
  MenuModel(label: "HAHAHAHA"),
];

final menuProvider = Provider((ref) {
  return testMenu;
});