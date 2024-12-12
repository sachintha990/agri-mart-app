import 'package:agri_mart/constants/bg_ellipse.dart';
import 'package:agri_mart/constants/user_panel/signup_form.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    

    return const Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          BgEllipse(),
          Center(
            child: SignupForm()
          )
        ],
      ),
    );
  }
}