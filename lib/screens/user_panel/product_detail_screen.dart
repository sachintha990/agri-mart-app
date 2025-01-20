import 'package:agri_mart/constants/user_panel/custom_app_bar.dart';
import 'package:agri_mart/constants/user_panel/home/today_price_card.dart';
import 'package:agri_mart/controller/product_controller.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomAppBar(),
                SizedBox(height: screenHeight * 0.02),
                // Product Section
                Center(
                  child: Column(
                    children: [
                      Stack(
                        clipBehavior: Clip
                            .none, // Allows widgets to go outside the bounds
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                              width: screenWidth * 0.7,
                              height: screenHeight * 0.2,
                              child: const ProductCard(
                                  imageUrl: 'assets/product/carrot.png',
                                  productName: 'Carrot',
                                  price: '')),
                          // Navigation Arrows
                          Positioned(
                            left: -40, // Move the left arrow outside the image
                            child: IconButton(
                              icon: const Icon(Icons.arrow_back_ios, size: 26),
                              color: Colors.green,
                              onPressed: () {
                                // Navigate to previous image
                              },
                            ),
                          ),
                          Positioned(
                            right:
                                -40, // Move the right arrow outside the image
                            child: IconButton(
                              icon:
                                  const Icon(Icons.arrow_forward_ios, size: 26),
                              color: Colors.green,
                              onPressed: () {
                                // Navigate to next image
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(5, (index) {
                              return Icon(
                                index < 3
                                    ? Icons.star
                                    : Icons.star_border, // 4 stars and 1 empty
                                color: Colors.green,
                              );
                            }),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Quantity Selector
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.grey[200],
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (quantity > 1) quantity--;
                                        });
                                      },
                                      child: const Icon(Icons.remove),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(quantity.toString()),
                                    const SizedBox(width: 8),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          quantity++;
                                        });
                                      },
                                      child: const Icon(Icons.add),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 16),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                onPressed: () {
                                  // Add to cart logic
                                },
                                child: const Text('Add to Cart'),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.02),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Description Section
                const Text(
                  'Description',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'This food is available in this location, and you can see our vegetables. You can either visit the location or get it via delivery.',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                SizedBox(height: screenHeight * 0.02),

                // Reviews Section
                const Text(
                  'Reviews',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),

                // Add Review Button
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    // Add review logic
                  },
                  icon: const Icon(
                    Icons.add,
                    color: Colors.black,
                  ),
                  label: const Text('Add Review',
                      style: TextStyle(fontSize: 16, color: Colors.black)),
                ),
                SizedBox(height: screenHeight * 0.01),

                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ReviewCard(review: 'Good seller and good products'),
                    ReviewCard(review: 'Excellent quality and service'),
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),

                // Other Products Section
                const Text(
                  'Other Products',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                SellerSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ReviewCard extends StatelessWidget {
  final String review;

  const ReviewCard({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            children: List.generate(5, (index) {
              return Icon(
                index < 2
                    ? Icons.star
                    : Icons.star_border, // 4 stars and 1 empty
                color: Colors.green,size: 18,
              );
            }),
          ),
          Text(
            review,
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}

class SellerSection extends StatelessWidget {
  const SellerSection({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.all(10.0),
      height: screenHeight * 0.2,
      width: screenWidth*0.9,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 25,
            backgroundColor: Colors.green,
            child: Icon(Icons.person, color: Colors.white),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'User Name',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'This user has other products',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          SizedBox(
            width: screenWidth * 0.28,
            height: screenHeight * 0.28,
            child: const ProductCard(imageUrl: 'assets/product/beans.png', productName: 'Beans', price: ''))
        ],
      ),
    );
  }
}
