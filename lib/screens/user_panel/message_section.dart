import 'package:agri_mart/constants/bg_ellipse.dart';
import 'package:flutter/material.dart';

class MessageSection extends StatelessWidget {
  final List<String> profileImages = [
    'assets/profile/profile1.png',
    'assets/profile/profile1.png',
    'assets/profile/profile1.png',
    'assets/profile/profile1.png',
    'assets/profile/profile1.png',
  ];

  final List<Map<String, String>> conversations = [
    {
      'title': 'Conversation One',
      'message': 'Latest message display here',
    },
    {
      'title': 'Conversation Two',
      'message': 'Latest message display here',
    },
    {
      'title': 'Conversation Three',
      'message': 'Latest message display here',
    },
    {
      'title': 'Conversation Four',
      'message': 'Latest message display here',
    },
    {
      'title': 'Conversation Five',
      'message': 'Latest message display here',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          // Header Section
          Stack(
            clipBehavior: Clip.none,
            children: [
              BgEllipse(),
              Positioned(
                top: 50,
                left: 16,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.arrow_back, color: Colors.green),
                  ),
                ),
              ),
              Positioned(
                bottom: -60,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(8),
                    color: Colors.grey[200],
                    height: 120,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: profileImages.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage(profileImages[index]),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight*0.05), 
          // Conversation List
          Expanded(
            child: ListView.builder(
              itemCount: conversations.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.grey.shade200,
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        const Icon(Icons.message, color: Colors.green),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              conversations[index]['title']!,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              conversations[index]['message']!,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
