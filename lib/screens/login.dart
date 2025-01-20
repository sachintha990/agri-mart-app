import 'package:agri_mart/constants/bg_ellipse.dart';
import 'package:agri_mart/constants/primary_button.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LogInState();
}

class _LogInState extends State<Login> {
  String _email = '';

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const BgEllipse(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Image.asset(
                      "assets/logo.png",
                      width: screenWidth * 0.5,
                    ),
                    SizedBox(height: screenHeight * 0.02), // Add some spacing
                    Container(
                      width: screenWidth,
                      height: screenHeight*0.08,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Email or Phone',
                          prefixIcon: Icon(Icons.email),
                          border: InputBorder.none,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter an email';
                          }
                          return null;
                        },
                        onSaved: (value) => _email = value!,
                      ),
                    ),
                    SizedBox(height: screenHeight*0.01), // Add spacing between inputs
                    Container(
                      width: screenWidth,
                      height: screenHeight*0.08,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.lock),
                          border: InputBorder.none,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a password';
                          }
                          return null;
                        },
                      ),
                    ),
                    PrimaryButton(
                      text: 'Log in',
                      onPressed: () {
                        Get.toNamed('/home');
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account?",
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.toNamed('/signup');
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(fontSize: 16, color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
