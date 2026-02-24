import 'package:flutter/cupertino.dart';
import 'package:frontend/constants.dart';

import '../../models/stall_model.dart';

class CardContainer extends StatelessWidget {
  const CardContainer({super.key, required this.stall});
  final Stall? stall;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFFF9644).withValues(alpha: 0.50)
      ),
      child: Text(stall!.stallName as String, style: TextStyle(
        color: kPrimaryColor
      ),),
    );
  }
}
