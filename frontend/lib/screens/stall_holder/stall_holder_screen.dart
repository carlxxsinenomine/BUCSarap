import 'package:flutter/material.dart';

class StallHolderScreen extends StatefulWidget {
  const StallHolderScreen({super.key});

  @override
  State<StallHolderScreen> createState() => _StallHolderScreenState();
}

class _StallHolderScreenState extends State<StallHolderScreen> {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Home, Queue, Processed History, Analytics?
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: Color(0xFFFF9644)
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      child: Container(
                        height: 80,
                        decoration: BoxDecoration(
                        ),
                        child: Column(
                          children: [
                            Icon(Icons.home),
                            Text("Home")
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      child: Container(
                        height: 80,
                        decoration: BoxDecoration(
                        ),
                        child: Column(
                          children: [
                            Icon(Icons.queue),
                            Text("Queue")
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      child: Container(
                        height: 80,
                        decoration: BoxDecoration(
                        ),
                        child: Column(
                          children: [
                            Icon(Icons.history),
                            Text("History")
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      child: Container(
                        height: 80,
                        decoration: BoxDecoration(
                        ),
                        child: Column(
                          children: [
                            Icon(Icons.analytics),
                            Text("Analytics")
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
  }
}
