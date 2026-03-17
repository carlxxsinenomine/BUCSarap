import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/components/menu_screen/count_button.dart';
import 'package:frontend/main.dart';
import 'package:frontend/models/menu_model.dart';

import '../constants.dart';
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
        actions: [
          Container(
            margin: EdgeInsets.only(right: 25),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.shopping_cart, color: Color(0xFFDA782B)),
            ),
          ),
        ],
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
              //   TODO: Implement SingleChildScroll
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
                      return Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: Color(0xFFEFE2D3),
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
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                width: double.infinity,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      menuItems[index].label!,
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(child: SizedBox()),
                                CountButton(symbol: "-"),
                                Text("0"),
                                CountButton(symbol: "+"),
                                Expanded(child: SizedBox()),
                              ],
                            ),
                          ],
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
