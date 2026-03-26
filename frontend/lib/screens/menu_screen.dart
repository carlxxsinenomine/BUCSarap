import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/components/menu_screen/count_button.dart';
import 'package:frontend/main.dart';
import 'package:frontend/models/menu_model.dart';
import 'package:frontend/screens/item_window.dart';
import 'package:frontend/screens/page_route/hero_dialog_route.dart';

import '../constants.dart';
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
    final double screenWidth = MediaQuery.sizeOf(context).width;
    final double screenHeight = MediaQuery.sizeOf(context).height;
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
                                  index: index,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 200,
                                    ),
                                    child: Container(
                                      height: double.infinity,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFEFE2D3),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 8,
                                          horizontal: 26,
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Expanded(child: SizedBox()),
                                            Expanded(
                                              flex: 16,
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFFF9644),
                                                  borderRadius: BorderRadius.circular(10)
                                                ),
                                                // Fix yellow underline under text: https://stackoverflow.com/questions/47114639/yellow-lines-under-text-widgets-in-flutter
                                                child: DefaultTextStyle(
                                                  style: TextStyle(),
                                                  child: Text("Picture"),
                                                ),
                                              ),
                                            ),
                                            Expanded(child: SizedBox()),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                IconButton(
                                                  onPressed: () {},
                                                  icon: Image.asset(
                                                    color: Color(0xFFFF9644),
                                                    scale: 1.4,
                                                    "images/icons/subtract_icon.png",
                                                  ),
                                                ),
                                                Center(
                                                  child: DefaultTextStyle(
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontFamily: "flame",
                                                      fontSize: 25,
                                                    ),
                                                    child: Text("0"),
                                                  ),
                                                ),
                                                IconButton(
                                                  onPressed: () {},
                                                  icon: Image.asset(
                                                    scale: 1.4,
                                                    color: Color(0xFFFF9644),
                                                    "images/icons/add_icon.png",
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Expanded(child: SizedBox()),
                                            GestureDetector(
                                              child: Container(
                                                height: 46,
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: Colors.black,
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                ),
                                                child: DefaultTextStyle(
                                                  style: TextStyle(
                                                    fontFamily: "flame",
                                                  ),
                                                  child: Center(
                                                    child: Text("Add to cart"),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(child: SizedBox()),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
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
                              color: Color(0xFFFF9644).withValues(alpha: 0.50),
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
                                        Flexible(
                                          child: Text(
                                            "1.5PHP",
                                            style: TextStyle(
                                              color: kPrimaryColor,
                                              fontFamily: "flame",
                                              fontSize: 13,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                      ],
                                    ),
                                  ),
                                ),
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
