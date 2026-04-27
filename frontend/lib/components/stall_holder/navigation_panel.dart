import 'package:flutter/material.dart';

class NavigationPanel extends StatelessWidget {
  const NavigationPanel({super.key, required this.currentRoute});

  final String currentRoute;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Color(0xFFFFC570).withValues(alpha: 0.8),
      ),
      child: Row(
        children: [
          // TODO: Create a separate class for this to reduce repetition
          Expanded(
            child: GestureDetector(
              onTap: () {
                if (currentRoute != '/stall_holder_screen') {
                  Navigator.pushNamed(context, '/stall_holder_screen');
                }
              },
              child: Container(
                height: 80,
                decoration: BoxDecoration(),
                child: Column(children: [Icon(Icons.home), Text("Home")]),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                if (currentRoute != '/queue_screen') {
                  Navigator.pushNamed(context, '/queue_screen');
                }
              },
              child: Container(
                height: 80,
                decoration: BoxDecoration(),
                child: Column(children: [Icon(Icons.queue), Text("Queue")]),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                if (currentRoute != '/analytics_screen') {
                  Navigator.pushNamed(context, '/analytics_screen');
                }
              },
              child: Container(
                height: 80,
                decoration: BoxDecoration(),
                child: Column(
                  children: [Icon(Icons.analytics), Text("Analytics")],
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                if (currentRoute != '/history_screen') {
                  Navigator.pushNamed(context, '/history_screen');
                }
              },
              child: Container(
                height: 80,
                decoration: BoxDecoration(),
                child: Column(children: [Icon(Icons.history), Text("History")]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
