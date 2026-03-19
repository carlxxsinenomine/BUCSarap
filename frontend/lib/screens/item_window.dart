// https://github.com/funwithflutter/flutter_ui_tips/blob/master/tip_003_popup_card/lib/add_todo_button.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/constants.dart';

class ItemWindow extends StatefulWidget {
  final int? index;

  const ItemWindow({required this.index});

  @override
  State<ItemWindow> createState() => _ItemWindowState();
}

class _ItemWindowState extends State<ItemWindow> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
        child: Hero(
          tag: "$itemTag-${widget.index}",
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 100,
              width: double.infinity,
              color: Color(0xFFFF9644).withValues(alpha: 0.50),
            ),
          ),
        ),
      ),
    );
  }
}
