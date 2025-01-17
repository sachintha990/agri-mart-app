import 'package:flutter/material.dart';

class BestSellers extends StatelessWidget {
  final sellers = [
    {
      'name': 'A.W Perera',
      'location': 'Anuradhapura',
      'rating': 5,
      'image': 'assets/sellers/seller1.png', 
    },
    {
      'name': 'M.S Nethu',
      'location': 'Kandy',
      'rating': 4,
      'image': 'assets/sellers/seller2.png', 
    },
    {
      'name': 'M.A Shen',
      'location': 'Gampaha',
      'rating': 3,
      'image': 'assets/sellers/seller3.png', 
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Best sellers',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {
                  // Navigate to another page or perform an action
                },
                child: const Icon(Icons.arrow_forward, size: 28),
              ),
            ],
          ),
          SizedBox(height: screenHeight*0.02),

          // Horizontal Scrolling List
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: sellers.map((seller) {
                return Padding(
                  padding: const EdgeInsets.all(10.0), // Add spacing between cards
                  child: SellerCard(
                    name: seller['name'] as String,
                    location: seller['location'] as String,
                    rating: seller['rating'] as int,
                    image: seller['image'] as String,
                  ),
                );
              }).toList(),
            ),
          ),
          SizedBox(height: screenHeight*0.02),
        ],
      ),
    );
  }
}

class SellerCard extends StatelessWidget {
  final String name;
  final String location;
  final int rating;
  final String image;

  const SellerCard({
    Key? key,
    required this.name,
    required this.location,
    required this.rating,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 200,
      child: Stack(
        clipBehavior: Clip.none, // Allow overflow for absolute positioning
        children: [
          // Card Background
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(16),
                
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 70),
                child: Column(
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        5,
                        (index) => Icon(
                          index < rating
                              ? Icons.star
                              : Icons.star_border,
                          color: Colors.green,
                          size: 16,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.location_on,
                            color: Colors.green, size: 14),
                        const SizedBox(width: 4),
                        Text(
                          location,
                          style: const TextStyle(
                              fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Absolute Positioned CircleAvatar with Seller Image
          Positioned(
            top: 30,
            left: 20,
            right: 20,
            child: CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(image), // Load seller-specific image
              backgroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
