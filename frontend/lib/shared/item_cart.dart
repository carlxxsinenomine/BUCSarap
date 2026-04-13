import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/cart_provider.dart';

class ItemCart extends ConsumerStatefulWidget {
  final int index;
  const ItemCart({super.key, required this.index});

  @override
  ConsumerState<ItemCart> createState() => _ItemCartState();
}

class _ItemCartState extends ConsumerState<ItemCart> {

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    final cartProducts = ref.watch(cartNotifierProvider);

    final ScrollController _scrollController = ScrollController();
    return Row(
      mainAxisAlignment:
      MainAxisAlignment.spaceBetween,
      children: [
        Container(child: Text("Picture")),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: [
            Text(
              "Product Name",
              style: TextStyle(
                fontFamily: "Flame",
                fontSize: 16,
              ),
            ),
            Text(
              "Product Info",
              style: TextStyle(
                fontFamily: "Flame",
                color: Colors.black45,
              ),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          height: double.infinity,
          child: Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    ref
                        .read(
                      cartNotifierProvider
                          .notifier,
                    )
                        .decrementProduct(
                      cartProducts.elementAt(
                        widget.index,
                      ),
                    );
                  });
                },
                child: Image.asset(
                  scale: 1.7,
                  color: Colors.black,
                  "images/icons/subtract_icon.png",
                ),
              ),
              VerticalDivider(color: Colors.black),
              Center(
                child: Text(
                  cartProducts
                      .elementAt(widget.index)
                      .quantity
                      .toString(),
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              VerticalDivider(color: Colors.black),
              GestureDetector(
                onTap: () {
                  setState(() {
                    ref
                        .read(
                      cartNotifierProvider
                          .notifier,
                    )
                        .incrementProduct(
                      cartProducts.elementAt(
                        widget.index,
                      ),
                    );
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(left: 6.1),
                  child: Image.asset(
                    scale: 1.7,
                    color: Colors.black,
                    "images/icons/add_icon.png",
                  ),// Dunno the fix, if solid 6 medj fade color nung divider
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
