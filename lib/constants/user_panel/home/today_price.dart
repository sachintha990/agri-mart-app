import 'package:agri_mart/constants/user_panel/home/today_price_card.dart';
import 'package:agri_mart/controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TodayPrice extends StatefulWidget {
  TodayPrice({super.key});

  @override
  State<TodayPrice> createState() => _TodayPriceState();
}

class _TodayPriceState extends State<TodayPrice> {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Header
          SectionHeader(
            title: "Today's Price",
            onPressed: () {},
          ),
          SizedBox(height: screenHeight * 0.01),

          // Grid of Products
          Obx(() {
            return GridView.builder(
              shrinkWrap: true, // Adjust height dynamically
              physics: const NeverScrollableScrollPhysics(), // Prevent scroll conflict
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 3 items per row
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 3 / 4, // Adjust card aspect ratio
              ),
              itemCount: productController.productList.length,
              itemBuilder: (context, index) {
                final product = productController.productList[index];
                return ProductCard(
                  imageUrl: product.imageUrl,
                  productName: product.name,
                  price: product.price,
                );
              },
            );
          }),
        ],
      ),
    );
  }
}

// Section Header Widget
class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const SectionHeader({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        IconButton(
          icon: const Icon(Icons.arrow_forward, color: Colors.green),
          onPressed: onPressed,
        ),
      ],
    );
  }
}
