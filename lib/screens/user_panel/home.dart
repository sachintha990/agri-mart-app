import 'package:agri_mart/constants/colors.dart';
import 'package:agri_mart/constants/user_panel/custom_app_bar.dart';
import 'package:agri_mart/constants/user_panel/home/category_card.dart';
import 'package:agri_mart/constants/user_panel/home/today_price.dart';
import 'package:agri_mart/controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(),

                SizedBox(
                  height: screenHeight * 0.05,
                ),
                // Categories Section
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Categories',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CategoryCard(
                              image: "assets/icons/vegetables.png",
                              label: 'Vegetables',
                              onTap: () {}),
                          CategoryCard(
                              image: 'assets/icons/fruits.png',
                              label: 'Fruits',
                              onTap: () {}),
                          CategoryCard(
                              image: 'assets/icons/others.png',
                              label: 'Others',
                              onTap: () {}),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight*0.02),

                // Today's Price Section
                TodayPrice(),

                SizedBox(height: screenHeight*0.02),

                // Best Sales Section
                SectionHeader(title: 'Best Sales', onPressed: () {}),
                const SizedBox(height: 10),
                _HorizontalProductList(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Message'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag), label: 'Orders'),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Category'),
        ],
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}

// Section Header Widget
class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const SectionHeader({required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Container(
          height: screenHeight * 0.04,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.green,
          ),
          child: Center(
            child: IconButton(
              icon: const Icon(
                Icons.arrow_forward,
                color: Colors.white,
                size: 25,
              ),
              onPressed: onPressed,
            ),
          ),
        )
      ],
    );
  }
}

// Horizontal Product List Widget
class _HorizontalProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _ProductCard(
              image: 'assets/potato.jpg', name: 'Potato', price: '₹20.00'),
          _ProductCard(
              image: 'assets/tomato.jpg', name: 'Tomato', price: '₹25.00'),
          _ProductCard(
              image: 'assets/beans.jpg', name: 'Beans', price: '₹40.00'),
        ],
      ),
    );
  }
}

// Product Card Widget
class _ProductCard extends StatelessWidget {
  final String image;
  final String name;
  final String price;

  const _ProductCard({
    required this.image,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child:
                Image.asset(image, height: 90, width: 120, fit: BoxFit.cover),
          ),
          const SizedBox(height: 5),
          Text(name,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Text(price, style: const TextStyle(fontSize: 14, color: Colors.grey)),
        ],
      ),
    );
  }
}
