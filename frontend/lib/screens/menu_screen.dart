import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/screens/item_window.dart';
import 'package:frontend/screens/page_route/hero_dialog_route.dart';
import 'package:frontend/shared/cart_button.dart';

import '../constants.dart';
import '../providers/cart_provider.dart';
import '../providers/menu_provider.dart';
import '../shared/back_button_container.dart';
import '../shared/cart_container.dart';

class MenuScreen extends ConsumerStatefulWidget {
  const MenuScreen({super.key});

  @override
  ConsumerState<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends ConsumerState<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    final menuItems = ref.read(menuProvider);
    final cartProducts = ref.watch(cartNotifierProvider);

    final double _ = MediaQuery.sizeOf(context).width;
    final double _ = MediaQuery.sizeOf(context).height;
    // final testProducts = ref.read(productProvider);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 110,
        backgroundColor: Color(0xFFEFE2D3),
        leadingWidth: 140,
        leading: BackButtonContainer(
          onTap: () {
            Navigator.pop(context);
          },
        ),
        actions: [CartButton(productQuantity: cartProducts.length)],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Center(
                child: Text(
                  "Menu",
                  style: TextStyle(fontSize: 30, fontFamily: "flame"),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GridView.builder(
                    itemCount: menuItems.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      childAspectRatio: 0.78,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            HeroDialogRoute(
                              builder: (context) {
                                return ItemWindow(
                                  productID: menuItems[index].productID,
                                  index: index,
                                );
                              },
                            ),
                          );
                        },
                        child: Hero(
                          tag: "$itemTag-$index",
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: Color(0xFFFFC570).withValues(alpha: 0.50),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(
                                        0xFFFF9644,
                                      ).withValues(alpha: 0.50),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    margin: EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    // padding: EdgeInsets.all(1),
                                    width: double.infinity,
                                    child: FittedBox(
                                      fit: BoxFit.fill,
                                      child: Image.asset("images/foods/beef_steak.jpg",),
                                    )
                                  ),
                                ),
                                Text(
                                  menuItems[index].productName!,
                                  style: TextStyle(
                                    color: kPrimaryColor,
                                    fontFamily: "flame",
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "1.5PHP",
                                  style: TextStyle(
                                    color: kPrimaryColor,
                                    fontFamily: "flame",
                                    fontSize: 13,
                                  ),
                                ),
                                SizedBox(height: 10),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          Positioned(bottom: 0, child: CartContainer()),
        ],
      ),
    );
  }
}
