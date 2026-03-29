import 'package:flutter/material.dart';

class CartButton extends StatelessWidget {
  final int? productQuantity;

  const CartButton({super.key, required this.productQuantity});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 25),
      child: Stack(
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart, color: Color(0xFFDA782B)),
          ),
          Positioned(
            right: 10,
            bottom: 25,
            child: Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  productQuantity.toString(),
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Roboto",
                    color: Colors.white
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
