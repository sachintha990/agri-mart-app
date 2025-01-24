import 'package:agri_mart/constants/bg_ellipse.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
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
                top: screenHeight * 0.15,
                left: (MediaQuery.of(context).size.width )*0.3,
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage('assets/profile/profile1.png'), 
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Uditha Dissanayake',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
           SizedBox(height: screenHeight * 0.05),
          // Orders and Favorites Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    // Navigate to Orders Page
                  },
                  child: Container(
                    width: screenWidth * 0.35,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.shopping_bag, color: Colors.yellow, size: 40),
                        SizedBox(height: 8),
                        Text('Orders',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            )),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigate to Favourites Page
                  },
                  child: Container(
                    width: screenWidth * 0.35,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 6,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.favorite, color: Colors.blue, size: 40),
                        SizedBox(height: 8),
                        Text('Favourites',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
           SizedBox(height: screenHeight*0.01),
          // Options Section
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(16),
              ),
              child: ListView(
                children: const [
                  ListTile(
                    leading: Icon(Icons.group, color: Colors.green),
                    title: Text('Invite Friends'),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.local_offer, color: Colors.green),
                    title: Text('Promotions'),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.help, color: Colors.green),
                    title: Text('Help'),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.settings, color: Colors.green),
                    title: Text('Manage Account'),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.info, color: Colors.green),
                    title: Text('About'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
