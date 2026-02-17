import 'package:flutter/material.dart';
import 'package:frontend/constants.dart';

import '../components/stall_selection_screen/back_button_container.dart';

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
        actions: [
          Container(
            margin: EdgeInsets.only(right: 25),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.shopping_cart, color: Color(0xFFDA782B)),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 150,
          bottom: 250,
          left: 40,
          right: 40,
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          decoration: BoxDecoration(
            color: Color(0xFFFF9644),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 2, child: SizedBox()),
              Expanded(flex: 2, child: SizedBox()),
              Text('Username', style: kJetbrainsLoginRegister),
              SizedBox(height: 10),
              TextField(
                style: kJetbrainsDescription,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      color: Colors.brown,
                      width: 0.0,
                    ),
                  ),
                  hintText: 'Username',
                ),
              ),
              Expanded(child: SizedBox()),
              Text('Password', style: kJetbrainsLoginRegister),
              SizedBox(height: 10),
              TextField(
                style: kJetbrainsDescription,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      color: Colors.brown,
                      width: 0.0,
                    ),
                  ),
                  hintText: 'Password',
                ),
              ),
              Expanded(flex: 1, child: SizedBox()),
              Center(
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 40,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFF5D371A),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'Login',
                        textAlign: TextAlign.center,
                        style: kJetbrainsDescription,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(flex: 1, child: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}
