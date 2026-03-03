import 'package:flutter_riverpod/flutter_riverpod.dart';

class MenuModel {
  final String? lebel;
  const MenuModel({required this.lebel});
}

List<MenuModel> testMenu = [
  MenuModel(lebel: "Adobo"),
  MenuModel(lebel: "Putangina"),
  MenuModel(lebel: "Deputa"),
  MenuModel(lebel: "HAHAHAHA"),
];

final menuProvider = Provider((ref) {
  return testMenu;
});