// Category Card Widget
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String image;
  final String label;
  final VoidCallback onTap;

  const CategoryCard({super.key, required this.image, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        GestureDetector(
            onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: CircleAvatar(
              radius: screenHeight * 0.04,
              backgroundColor: Colors.white,
              child: Image.asset(
                image, // Using the getter to fetch the image path
                height: screenHeight * 0.08, // Example dynamic height
                width: screenHeight * 0.1,  // Example dynamic width
                //fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(height: screenHeight*0.01,),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}