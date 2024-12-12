import 'package:agri_mart/controller/product_controller.dart';
import 'package:agri_mart/screens/user_panel/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TodayPrice extends StatelessWidget {
  TodayPrice({super.key});

  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          SectionHeader(
            title: "Today's Price",
            onPressed: () {},
          ),
          SizedBox(height: screenHeight * 0.01),
          Obx(() {
            if (productController.productList.isEmpty) {
              return Center(child: CircularProgressIndicator());
            } else {
              return GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: screenWidth > 500 ? 3 : 2, // Responsive grid
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: screenHeight * 0.0008,
                ),
                itemCount: productController.productList.length,
                itemBuilder: (context, index) {
                  final product = productController.productList[index];
                  return GestureDetector(
                    onTap: () {
                      // Handle product tap
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      margin: EdgeInsets.all(8),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.network(
                            product.imageUrl,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              product.name,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              'Rs: ${product.price}(1 KG)',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          })
        ],
      ),
    );
  }
}
