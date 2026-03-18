import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/shared/back_button_container.dart';
import 'package:frontend/components/stall_selection_screen/card_container.dart';
import 'package:frontend/main.dart';
import 'package:frontend/models/stall_model.dart';
import 'package:frontend/shared/order_button.dart';
import 'order_button.dart';

class CartContainer extends ConsumerStatefulWidget {
  const CartContainer({super.key});

  @override
  ConsumerState<CartContainer> createState() => _CartContainerState();
}

class _CartContainerState extends ConsumerState<CartContainer>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  // Reference: https://stackoverflow.com/questions/66640920/how-do-you-animate-to-expand-a-container-from-0-height-to-the-height-of-its-cont
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.linear);
  }

  _toggleContainer() {
    if (_animation.status != AnimationStatus.completed) {
      _controller.forward();
    } else {
      _controller.animateBack(0, duration: Duration(milliseconds: 100));
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    return Column(
      children: [
        SizeTransition(
          sizeFactor: _animation,
          axis: Axis.vertical,
          axisAlignment: -1,
          child: Container(
            height: 400,
            width: screenWidth,
            color: Color(0xFFD9BFA1).withValues(alpha: 0.7),
            child: Column(),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          height: 100,
          width: screenWidth,
          color: Color(0xFFD9BFA1).withValues(alpha: 0.7),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OrderButton(onTap: () => _toggleContainer(), label: 'My Order'),
              Expanded(flex: 4, child: SizedBox()),
              Text(
                "|",
                style: TextStyle(
                  color: Color(0xFF5D371A),
                  fontSize: 30,
                  fontFamily: 'Flame',
                  fontWeight: FontWeight.w500,
                ),
              ),
              Expanded(child: SizedBox()),
              Text(
                "500 PHP",
                style: TextStyle(
                  fontFamily: 'Flame',
                  fontSize: 20,
                  color: Color(0xFF5D371A),
                ),
              ),
            ],
          ),
        ),

      ],
    );
  }
}
