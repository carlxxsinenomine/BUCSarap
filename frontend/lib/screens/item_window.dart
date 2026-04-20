// https://github.com/funwithflutter/flutter_ui_tips/blob/master/tip_003_popup_card/lib/add_todo_button.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/models/product_model.dart';
import 'package:frontend/models/product_pile_model.dart';
import 'package:frontend/providers/cart_provider.dart';
import 'package:frontend/providers/menu_provider.dart';

class ItemWindow extends ConsumerStatefulWidget {
  final int? productID;
  final int? index;

  const ItemWindow({super.key, required this.productID, this.index});

  @override
  ConsumerState<ItemWindow> createState() => _ItemWindowState();
}

class _ItemWindowState extends ConsumerState<ItemWindow> {
  late int itemQuantity;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    itemQuantity = 0;
  }

  @override
  Widget build(BuildContext context) {
    final cartProducts = ref.watch(cartNotifierProvider);
    final productList = ref.read(menuProvider);

    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
        child: Hero(
          tag: "$itemTag-${widget.index}",
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 200,
              ),
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFFFFC570).withValues(alpha: 0.9),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 26,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(child: SizedBox()),
                      Expanded(
                        flex: 16,
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.black45,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          // Fix yellow underline under text: https://stackoverflow.com/questions/47114639/yellow-lines-under-text-widgets-in-flutter
                          child: DefaultTextStyle(
                            style: TextStyle(),
                            child: FittedBox(
                              fit: BoxFit.fill,
                                child: Image.asset("images/foods/beef_steak.jpg")
                            )
                          ),
                        ),
                      ),
                      Expanded(child: SizedBox()),
                      Expanded(
                        flex: 3,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFD66F1D),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                child: DefaultTextStyle(
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "flame",
                                    fontSize: 30,
                                  ),
                                  child: Text("$itemQuantity"),
                                ),
                              ),
                              Expanded(child: SizedBox()),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (itemQuantity != 0) {
                                      itemQuantity -= 1;
                                    }
                                  });
                                },
                                icon: Image.asset(
                                  color: Colors.black,
                                  scale: 1.4,
                                  "images/icons/subtract_icon.png",
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    itemQuantity += 1;
                                  });
                                },
                                icon: Image.asset(
                                  scale: 1.4,
                                  color: Colors.black,
                                  "images/icons/add_icon.png",
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(child: SizedBox()),
                      Row(
                        children: [
                          // Expanded(child: SizedBox()),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                height: 46,
                                // width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(
                                    0x6CFF8B5A,
                                  ).withValues(alpha: 0.5),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: DefaultTextStyle(
                                  style: TextStyle(
                                    fontFamily: "flame",
                                    color: Colors.black,
                                  ),
                                  child: Center(child: Text("Cancel")),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                if (itemQuantity > 0) {
                                  ref
                                      .read(cartNotifierProvider.notifier)
                                      .addProduct(
                                        ProductPile(
                                          productID: widget.productID,
                                          quantity: itemQuantity,
                                        ),
                                      );
                                }
                              },
                              child: Container(
                                height: 46,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFF5A5A),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: DefaultTextStyle(
                                  style: TextStyle(fontFamily: "flame"),
                                  child: Center(child: Text("Add")),
                                ),
                              ),
                            ),
                          ),
                          // Expanded(child: SizedBox()),
                        ],
                      ),
                      Expanded(child: SizedBox()),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
