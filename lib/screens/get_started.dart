import 'package:agri_mart/constants/bg_ellipse.dart';
import 'package:agri_mart/constants/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Background color
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Top Green Curved Section
          BgEllipse(),
          // Logo Section
          Image.asset(
            'assets/logo.png',
            height: 300,
          ),
          // "Get Started" Button Section
          PrimaryButton(text: "Get Started", onPressed: (){
            Get.toNamed('/login');
          } ),
          const SizedBox(height: 10,),
        ],
      ),
    );
  }
}


