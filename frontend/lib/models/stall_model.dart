import 'package:flutter_riverpod/flutter_riverpod.dart';

class Stall {
  final String? stallName;

  const Stall(this.stallName);
}

final List<Stall> test_list = [
  Stall("Abby&Ynna"),
  Stall("Benmark"),
  Stall("Celzo's"),
  Stall("Fairy Swirl"),
  Stall("Gracianas"),
  Stall("Kiko"),
];

final productProvider = Provider((ref) {
  return test_list;
});
