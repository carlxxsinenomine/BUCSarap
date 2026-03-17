import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CountButton extends StatelessWidget {
  const CountButton({required this.symbol});
  final String? symbol;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          // color: Colors.brown,
        ),
        child: Center(
          child: Text(
            symbol!,
            style: TextStyle(
              color: Color(0xA0000000),
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: "flame"
            ),
          ),
        ),
      ),
    );
  }
}
