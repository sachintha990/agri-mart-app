import 'package:agri_mart/constants/user_panel/custom_app_bar.dart';
import 'package:agri_mart/constants/user_panel/home/today_price_card.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  final sellers = [
    {
      'name': 'User Name',
      'location': 'Thalawa',
      'stock': '150 kg',
      'price': 'RS:230',
    },
    {
      'name': 'User Name',
      'location': 'Thalawa',
      'stock': '150 kg',
      'price': 'RS:230',
    },
    {
      'name': 'User Name',
      'location': 'Thalawa',
      'stock': '150 kg',
      'price': 'RS:230',
    },
    {
      'name': 'User Name',
      'location': 'Thalawa',
      'stock': '150 kg',
      'price': 'RS:230',
    },
  ];

   ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Section
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Center(
                      child: Column(
                        children: [
                          const CustomAppBar(),
                          SizedBox(height: screenHeight * 0.02),
                          const Text("Carrot", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          // Product Image
                           const ProductCard(imageUrl: 'assets/product/carrot.png', productName: 'Carrot', price: ''),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
          
              // Sellers List Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: sellers.map((seller) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: SellerCard(
                        name: seller['name']!,
                        location: seller['location']!,
                        stock: seller['stock']!,
                        price: seller['price']!,
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SellerCard extends StatelessWidget {
  final String name;
  final String location;
  final String stock;
  final String price;

  const SellerCard({
    super.key,
    required this.name,
    required this.location,
    required this.stock,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(16),
       
      ),
      child: Row(
        children: [
          // User Avatar
          const CircleAvatar(
            radius: 25,
            backgroundColor: Colors.green,
            child: Icon(Icons.person_2, color: Colors.white,size: 40,),
          ),
          const SizedBox(width: 12),
          // Seller Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 14, color: Colors.red),
                    const SizedBox(width: 4),
                    Text(
                      location,
                      style: const TextStyle(fontSize: 12, color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Stock and Price
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                'Available Stock',
                style: TextStyle(fontSize: 12, color: Colors.black),
              ),
              Text(
                stock,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              const Text(
                'Unit price (1kg)',
                style: TextStyle(fontSize: 12, color: Colors.black),
              ),
              Text(
                price,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
