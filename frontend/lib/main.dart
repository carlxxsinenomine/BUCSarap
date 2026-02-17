import 'package:flutter/material.dart';
import 'package:frontend/screens/login_screen.dart';
import 'package:frontend/screens/stall_selection_screen.dart';
import 'package:frontend/screens/welcome_screen.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Color(0xFFEFE2D3)),
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomeScreen(),
        '/stall_selection': (context) => StallSelectionScreen(),
        '/login': (context) => LoginScreen(),
      },
    );
  }
}
