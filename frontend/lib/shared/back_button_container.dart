import 'package:flutter/material.dart';

class BackButtonContainer extends StatelessWidget {
  const BackButtonContainer({ required this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: GestureDetector(
        onTap: onTap,
        child: Stack(
          alignment: AlignmentDirectional.centerStart,
          children: [
            Icon(Icons.arrow_back_ios, color: Color(0xFFDA782B),),
            Positioned(
                right: 35,
                top: 38,
                child: Text("Back", style: TextStyle(
                    color: Color(0xFFDA782B),
                    fontFamily: 'Flame',
                    fontSize: 22
                ),))
          ],
        ),
      ),
    );
  }
}
