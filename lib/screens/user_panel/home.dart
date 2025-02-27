import 'package:agri_mart/constants/user_panel/bottom_nav_bar.dart';
import 'package:agri_mart/constants/user_panel/home/category.dart';
import 'package:agri_mart/constants/user_panel/custom_app_bar.dart';
import 'package:agri_mart/constants/user_panel/home/best_sales.dart';
import 'package:agri_mart/constants/user_panel/home/others_section.dart';
import 'package:agri_mart/constants/user_panel/home/today_price.dart';
import 'package:agri_mart/controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(),
                SizedBox( height: screenHeight * 0.05,),
                // Categories Section
                const Category(),
                SizedBox(height: screenHeight*0.02),
                
                // Today's Price Section
                TodayPrice(),
                SizedBox(height: screenHeight*0.02),
                
                // Best Sales Section
                BestSellers(),
                const SizedBox(height: 10),

                // Other Section
                OthersSection(),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBarScreen(),
    );
  }
}