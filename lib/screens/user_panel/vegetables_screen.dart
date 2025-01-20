
import 'package:flutter/material.dart';

class VegetablesScreen extends StatefulWidget {
  @override
  State<VegetablesScreen> createState() => _VegetablesScreenState();
}

class _VegetablesScreenState extends State<VegetablesScreen> {
  // Sample data for the grid
  final List<Map<String, String>> products = [
    {'name': 'Potato', 'price': '240.00', 'image': 'assets/product/potato.png'},
    {'name': 'Beans', 'price': '340.00', 'image': 'assets/product/beans.png'},
    {'name': 'Carrot', 'price': '140.00', 'image': 'assets/product/carrot.png'},
    {'name': 'Watermelon', 'price': '240.00', 'image': 'assets/product/watermelon.png'},
    {'name': 'Banana', 'price': '240.00', 'image': 'assets/product/banana.png'},
    {'name': 'Grapes', 'price': '240.00', 'image': 'assets/product/grapes.png'},
    {'name': 'Potato', 'price': '240.00', 'image': 'assets/product/potato.png'},
    {'name': 'Beans', 'price': '340.00', 'image': 'assets/product/beans.png'},
    {'name': 'Carrot', 'price': '140.00', 'image': 'assets/product/carrot.png'},
    {'name': 'Watermelon', 'price': '240.00', 'image': 'assets/product/watermelon.png'},
    {'name': 'Banana', 'price': '240.00', 'image': 'assets/product/banana.png'},
    {'name': 'Grapes', 'price': '240.00', 'image': 'assets/product/grapes.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Vegetables", style: TextStyle(color: Colors.black)),
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.green),
        actions: [
          IconButton(
            icon: const CircleAvatar(
              backgroundColor: Colors.green,
              child: Icon(Icons.arrow_forward, color: Colors.white),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height, // Ensures GridView has height
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // Number of columns
              crossAxisSpacing: 12, // Horizontal spacing
              mainAxisSpacing: 12, // Vertical spacing
              childAspectRatio: 0.7, // Adjust the height-to-width ratio
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return ProductCard(
                imageUrl: product['image'] ?? '',
                productName: product['name'] ?? '',
                price: product['price'] ?? '',
              );
              
            },
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String productName;
  final String price;

  const ProductCard({
    Key? key,
    required this.imageUrl,
    required this.productName,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imageUrl,
            height: 80,
            width: 80,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return const Icon(Icons.broken_image, size: 80, color: Colors.grey);
            },
          ),
          const SizedBox(height: 10),
          Text(productName, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text('Rs. $price', style: const TextStyle(color: Colors.green)),
        ],
      ),
    );
  }
}
