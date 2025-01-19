import 'package:flutter/material.dart';

class OthersSection extends StatelessWidget {
  final items = [
    {
      'name': 'Gardening Tool',
      'image': 'assets/others/gardening_tool.png',
    },
    {
      'name': 'Seed Drill Machine',
      'image': 'assets/others/seed_drill_machine.png',
    },
    {
      'name': 'SHEFFA Fertilizer',
      'image': 'assets/others/fertilizer.png',
    },
  ];

  OthersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Others',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {
                  // Navigate to another page or perform an action
                },
                child: const Icon(
                  Icons.arrow_forward,
                  size: 28,
                  color: Colors.green,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Horizontal Scrolling List
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: items.map((item) {
                return Padding(
                  padding: const EdgeInsets.all( 12.0),
                  child: OtherCard(
                    name: item['name']!,
                    image: item['image']!,
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class OtherCard extends StatelessWidget {
  final String name;
  final String image;

  const OtherCard({
    super.key,
    required this.name,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 140,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Product Image
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 8),
          // Product Name
          Text(
            name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
