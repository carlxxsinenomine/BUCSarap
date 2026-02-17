import 'package:flutter/cupertino.dart';

class BoxContainer extends StatelessWidget {
  const BoxContainer({
    required this.onTap,
    required this.color,
    required this.label,
    required this.labelColor
  });

  final VoidCallback? onTap;
  final Color? color;
  final String? label;
  final Color? labelColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 167,
        height: 233,
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            label!,
            style: TextStyle(fontSize: 28, fontFamily: 'Flame', color: labelColor),
          ),
        ),
      ),
    );
  }
}
