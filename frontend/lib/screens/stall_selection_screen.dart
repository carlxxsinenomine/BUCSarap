import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/shared/back_button_container.dart';
import 'package:frontend/components/stall_selection_screen/card_container.dart';
import 'package:frontend/main.dart';
import 'package:frontend/shared/cart_container.dart';
import 'package:frontend/shared/order_button.dart';

import '../constants.dart';
import '../providers/stall_provider.dart';

class StallSelectionScreen extends ConsumerStatefulWidget {
  const StallSelectionScreen({super.key});

  @override
  ConsumerState<StallSelectionScreen> createState() =>
      _StallSelectionScreenState();
}

class _StallSelectionScreenState extends ConsumerState<StallSelectionScreen>
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
    final testProducts = ref.read(productProvider);
    final screenWidth = MediaQuery.sizeOf(context).width;

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
                  "Select Food Stall",
                  style: TextStyle(fontSize: 30, fontFamily: "flame"),
                ),
              ),
              //   TODO: Implement SingleChildScroll
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GridView.builder(
                    itemCount: testProducts.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      childAspectRatio: 1,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/menu_screen');
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            color: Color(0xFFFF9644).withValues(alpha: 0.50),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                testProducts[index].stallName!,
                                style: TextStyle(
                                  color: kPrimaryColor,
                                  fontFamily: "flame",
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
         Positioned(
           bottom: 0,
           child: CartContainer(
           ),
         ),
        ],
      ),
    );
  }
}
