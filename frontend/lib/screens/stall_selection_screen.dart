import 'package:flutter/material.dart';
import 'package:frontend/components/stall_selection_screen/back_button_container.dart';

class StallSelectionScreen extends StatelessWidget {
  const StallSelectionScreen({super.key});

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
          Container(
            margin: EdgeInsets.only(right: 25),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.shopping_cart, color: Color(0xFFDA782B),),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Text("Select Food Stall"),
        //   TODO: Implement SingleChildScroll
        ],
      ),
    );
  }
}
