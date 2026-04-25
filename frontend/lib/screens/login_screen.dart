import 'package:flutter/material.dart';
import 'package:frontend/constants.dart';

import '../shared/back_button_container.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 110,
        backgroundColor: Color(0xFFEFE2D3),
        leadingWidth: 140,
        leading: BackButtonContainer(
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 150,
            bottom: 250,
            left: 40,
            right: 40,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Login",
                style: TextStyle(fontSize: 30, fontFamily: "flame"),
              ),
              Expanded(flex: 1, child: SizedBox()),
              TextField(
                style: TextStyle(color: Colors.black, fontFamily: "Flame"),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.brown,
                      width: 0.0,
                    ),
                  ),
                  hintStyle: TextStyle(color: Colors.black45),
                  hintText: 'Username',
                ),
              ),
              SizedBox(height: 10),
              TextField(
                style: TextStyle(color: Colors.black, fontFamily: "Flame"),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.brown,
                      width: 0.0,
                    ),
                  ),
                  hintStyle: TextStyle(color: Colors.black45),
                  hintText: 'Password',
                ),
              ),
              SizedBox(height: 40),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/stall_holder_screen');
                },
                child: Container(
                  height: 45,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFFDA782B),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      'Login',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Flame",
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(flex: 2, child: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}
