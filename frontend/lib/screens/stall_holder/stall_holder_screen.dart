import 'package:flutter/material.dart';

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
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            onPressed: () {},
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
                      color: Color(0xFFFDBD10).withValues(alpha: 0.50),
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
                                      color: Color(0xFFEC1C24),
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
                                      color: Colors.black.withValues(
                                        alpha: 0.08,
                                      ),
                                      borderRadius: BorderRadius.circular(22),
                                      border: Border.all(
                                        width: 2,
                                        color: Color(0xFFC46200),
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
          Container(
            height: 100,
            decoration: BoxDecoration(
              color: Color(0xFFFFC570).withValues(alpha: 0.8),
            ),
            child: Row(
              children: [
                // TODO: Create a separate class for this to reduce repetition
                Expanded(
                  child: GestureDetector(
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(),
                      child: Column(children: [Icon(Icons.home), Text("Home")]),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(),
                      child: Column(
                        children: [Icon(Icons.queue), Text("Queue")],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(),
                      child: Column(
                        children: [Icon(Icons.analytics), Text("Analytics")],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(),
                      child: Column(
                        children: [Icon(Icons.history), Text("History")],
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
  }
}
