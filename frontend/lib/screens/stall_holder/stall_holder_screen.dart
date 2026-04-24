import 'package:flutter/material.dart';
import 'package:frontend/components/stall_holder/navigation_panel.dart';

import '../../shared/back_button_container.dart';
import '../../shared/cart_button.dart';

class StallHolderScreen extends StatefulWidget {
  const StallHolderScreen({super.key});

  @override
  State<StallHolderScreen> createState() => _StallHolderScreenState();
}

class _StallHolderScreenState extends State<StallHolderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 110,
        backgroundColor: Color(0xFFEFE2D3),
        leadingWidth: 140,
        leading: BackButtonContainer(
          onTap: () {
            Navigator.popUntil(context, ModalRoute.withName('/'));
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/add_product_screen');
            },
            icon: Icon(Icons.add, color: Color(0xFFDA782B)),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 8,
                right: 8,
                top: 0,
                bottom: 0,
              ),
              child: GridView.builder(
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFE591),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(decoration: BoxDecoration()),
                        ),
                        SizedBox(
                          height: 90,
                          child: Column(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  child: Container(
                                    height: 42,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFEC1C24).withValues(alpha: 0.8),
                                      borderRadius: BorderRadius.circular(
                                        22,
                                      ), // rect feels more native than pill
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Remove',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Flame',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 2),
                              Expanded(
                                child: GestureDetector(
                                  child: Container(
                                    height: 38,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFF9644).withValues(alpha: 0.50),
                                      borderRadius: BorderRadius.circular(22),
                                      border: Border.all(
                                        width: 2,
                                        color: Color(0xFFDA782B),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Not available',
                                        style: TextStyle(
                                          color: Color(0xFF7A3D00),
                                          fontFamily: 'Flame',
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          // Home, Queue, Processed History, Analytics?
         NavigationPanel()
        ],
      ),
    );
  }
}
