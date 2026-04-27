import 'package:flutter/material.dart';
import 'package:frontend/constants.dart';

import '../../components/stall_holder/navigation_panel.dart';
import '../../shared/back_button_container.dart';

enum ChartStatus { MONTHLY, WEEKLY, DAILY }

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  ChartStatus _status = ChartStatus.MONTHLY;

  final Color active = Color(0xFFFFC570).withValues(alpha: 0.8);
  final Color inactive = Color(0xFFEFE2D3);

  void _updateStatus(ChartStatus status) {
    _status = status;
  }

  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 110,
        backgroundColor: Color(0xFFEFE2D3),
        leadingWidth: 140,
        leading: BackButtonContainer(
          onTap: () {
            Navigator.popUntil(
              context,
              ModalRoute.withName('/stall_holder_screen'),
            );
          },
        ),
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       Navigator.pushNamed(context, '/add_product_screen');
        //     },
        //     icon: Icon(Icons.add, color: Color(0xFFDA782B)),
        //   ),
        // ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Earnings", style: kJetbrainsFontTitle),
                      SizedBox(height: 10),
                      Container(
                        height: 250,
                        decoration: BoxDecoration(
                          color: Color(0xFFFFC570).withValues(alpha: 0.8),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 10,
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 45,
                              decoration: BoxDecoration(
                                color: Color(0xFFEFE2D3),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _updateStatus(ChartStatus.MONTHLY);
                                      });
                                    },
                                    child: Container(
                                      height: 35,
                                      width: 120,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: _status == ChartStatus.MONTHLY
                                            ? active
                                            : inactive,
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Monthly",
                                          style: TextStyle(fontFamily: "Flame"),
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _updateStatus(ChartStatus.WEEKLY);
                                      });
                                    },
                                    child: Container(
                                      height: 35,
                                      width: 120,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: _status == ChartStatus.WEEKLY
                                            ? active
                                            : inactive,
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Weekly",
                                          style: TextStyle(fontFamily: "Flame"),
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _updateStatus(ChartStatus.DAILY);
                                      });
                                    },
                                    child: Container(
                                      height: 35,
                                      width: 120,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: _status == ChartStatus.DAILY
                                            ? active
                                            : inactive,
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Daily",
                                          style: TextStyle(fontFamily: "Flame"),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15),
                      Text("Income History", style: kJetbrainsFontTitle),
                      SizedBox(height: 10),
                      Container(
                        height: 250,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xFFFFC570).withValues(alpha: 0.8),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 10,
                        ),
                        child: Column(
                          children: [

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          NavigationPanel(currentRoute: currentRoute as String),
        ],
      ),
    );
  }
}
