import 'package:flutter/material.dart';

import '../../components/stall_holder/navigation_panel.dart';
import '../../shared/back_button_container.dart';

class TransactionHistoryScreen extends StatefulWidget {
  const TransactionHistoryScreen({super.key});

  @override
  State<TransactionHistoryScreen> createState() => _TransactionHistoryScreenState();
}

class _TransactionHistoryScreenState extends State<TransactionHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 110,
        backgroundColor: Color(0xFFEFE2D3),
        leadingWidth: 140,
        leading: BackButtonContainer(
          onTap: () {
            Navigator.popUntil(context, ModalRoute.withName('/stall_holder_screen'));
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
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          NavigationPanel(),
        ],
      ),
    );
  }
}
