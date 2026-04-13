import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:frontend/main.dart';
import 'package:frontend/providers/cart_provider.dart';

import '../shared/back_button_container.dart';
import '../shared/order_button.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cartProducts = ref.watch(cartNotifierProvider);
    final ScrollController _scrollController = ScrollController();
    final double screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar:AppBar(
          toolbarHeight: 110,
          backgroundColor: Color(0xFFEFE2D3),
          leadingWidth: 140,
          leading: BackButtonContainer(
            onTap: () {
              Navigator.pop(context);
            },
          ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 400,
            padding: const EdgeInsets.only(left: 10, right: 10, top: 8),
            child: ListView.builder(
              controller: _scrollController,
              itemCount: cartProducts.length,
              itemBuilder: (BuildContext context, int index) {
                // https://www.geeksforgeeks.org/flutter/flutter-slidable/
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  child: Slidable(
                    key: const ValueKey(0),
                    endActionPane: ActionPane(
                      motion: ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (BuildContext context) {
                            setState(() {
                              ref
                                  .read(cartNotifierProvider.notifier)
                                  .removeProduct(
                                cartProducts.elementAt(index),
                              );
                            });
                          },
                          icon: Icons.delete,
                          label: "Delete",
                          backgroundColor: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ],
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 90,
                      padding: EdgeInsets.symmetric(
                        horizontal: 19,
                        vertical: 20,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFFFF9644),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
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
                                          index,
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
                                        .elementAt(index)
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
                                          index,
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
                                    ), // Dunno the fix, if solid 6 medj fade color nung divider
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            height: 100,
            width: screenWidth,
            color: Color(0xFFFFC570).withValues(alpha: 0.8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

              ],
            ),
          ),
        ],
      ),
    );
  }
}
