// https://github.com/funwithflutter/flutter_ui_tips/blob/master/tip_003_popup_card/lib/add_todo_button.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/constants.dart';

class ItemWindow extends StatefulWidget {
  final int? index;
  final Widget? child;
  const ItemWindow({required this.index, required this.child});


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
            child: widget.child!,
          ),
        ),
      ),
    );
  }
}
