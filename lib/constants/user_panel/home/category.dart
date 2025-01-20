import 'package:agri_mart/constants/user_panel/home/category_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
                  child: Column(
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Categories',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CategoryCard(
                              image: "assets/icons/vegetables.png",
                              label: 'Vegetables',
                              onTap: () {
                                Get.toNamed('/user_panel/vegetables');
                              }),
                          CategoryCard(
                              image: 'assets/icons/fruits.png',
                              label: 'Fruits',
                              onTap: () {
                                Get.toNamed('/user_panel/fruites');
                              }),
                          CategoryCard(
                              image: 'assets/icons/others.png',
                              label: 'Others',
                              onTap: () {
                                Get.toNamed('/user_panel/others');
                              }),
                        ],
                      ),
                    ],
                  ),
                );
  }
}