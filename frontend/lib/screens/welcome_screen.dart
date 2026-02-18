import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:frontend/main.dart';
import 'package:frontend/screens/stall_selection_screen.dart';

import '../components/welcome_screen/box_container.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome!",
              style: TextStyle(
                color: Color(0xFFDA782B),
                fontFamily: 'Flame',
                fontSize: 45,
              ),
            ),
            Text(
              "BUCSarap: Portable Ordering & Queueing System for Bicol University College of Science Canteen",
              style: TextStyle(
                color: Color(0xFF5D371A),
                fontFamily: 'Flame',
                fontSize: 16,
              ),
            ),
            SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BoxContainer(
                  onTap: () {
                    Navigator.pushNamed(context, '/stall_selection');
                  },
                  color: Color(0xFFFF9644),
                  label: "I'm a student!",
                  labelColor: Color(0xFFFFFDF1),
                ),
                BoxContainer(
                  onTap: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  color: Color(0xFFFF9644).withValues(alpha: 0.50g),
                  label: "I'm a food stall owner",
                  labelColor: Color(0xFFDA782B),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
