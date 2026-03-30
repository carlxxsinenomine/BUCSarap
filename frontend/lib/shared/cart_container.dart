import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/providers/cart_provider.dart';
import 'package:frontend/shared/order_button.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CartContainer extends ConsumerStatefulWidget {
  const CartContainer({super.key});

  @override
  ConsumerState<CartContainer> createState() => _CartContainerState();
}

class _CartContainerState extends ConsumerState<CartContainer>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  // Reference: https://stackoverflow.com/questions/66640920/how-do-you-animate-to-expand-a-container-from-0-height-to-the-height-of-its-cont
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.linear);
  }

  _toggleContainer() {
    if (_animation.status != AnimationStatus.completed) {
      _controller.forward();
    } else {
      _controller.animateBack(0, duration: Duration(milliseconds: 100));
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    final cartProducts = ref.watch(cartNotifierProvider);

    final ScrollController _scrollController = ScrollController();

    return Column(
      children: [
        SizeTransition(
          sizeFactor: _animation,
          axis: Axis.vertical,
          axisAlignment: -1,
          child: Container(
            height: 430,
            width: screenWidth,
            color: Color(0xFFFFC570).withValues(alpha: 0.5),
            child: Column(
              children: [
                // Text("My Cart", style: TextStyle(fontFamily: "Flame", fontSize: 20)),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(child: Text("Picture")),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                                  cartNotifierProvider.notifier,
                                                )
                                                .decrementProduct(
                                                  cartProducts.elementAt(index),
                                                );
                                          });
                                        },
                                        child: Icon(Icons.arrow_back_ios),
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
                                          setState(() {});
                                        },
                                        child: Container(
                                          child: Icon(Icons.arrow_forward_ios),
                                          margin: EdgeInsets.only(
                                            left: 6.1,
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
              ],
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          height: 100,
          width: screenWidth,
          color: Color(0xFFFFC570).withValues(alpha: 0.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OrderButton(
                onTap: () {
                  _toggleContainer();
                  if (_scrollController.hasClients) {
                    _scrollController.jumpTo(0.0);
                  }
                },
                label: 'My Order',
              ),
              Expanded(flex: 4, child: SizedBox()),
              Text(
                "|",
                style: TextStyle(
                  color: Color(0xFF5D371A),
                  fontSize: 30,
                  fontFamily: 'Flame',
                  fontWeight: FontWeight.w500,
                ),
              ),
              Expanded(child: SizedBox()),
              Text(
                "500 PHP",
                style: TextStyle(
                  fontFamily: 'Flame',
                  fontSize: 20,
                  color: Color(0xFF5D371A),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
