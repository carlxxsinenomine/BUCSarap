import 'package:flutter/cupertino.dart';

class StatusTab extends StatelessWidget {
  const StatusTab({super.key, required this.child, this.decoration, this.height, this.width});
  final Widget child;
  final BoxDecoration? decoration;
  final int? height;
  final int? width;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration,
      child: child,
    );
  }
}
