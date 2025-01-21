import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:agri_mart/constants/bg_ellipse.dart';

class ProfileScreen extends StatelessWidget {
  Future<Map<String, dynamic>?> _fetchUserData() async {
    try {
      User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        DocumentSnapshot<Map<String, dynamic>> userDoc = await FirebaseFirestore
            .instance
            .collection('users')
            .doc(currentUser.uid)
            .get();
        if (userDoc.exists) {
          return userDoc.data();
        }
      }
    } catch (e) {
      debugPrint("Error fetching user data: $e");
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: FutureBuilder<Map<String, dynamic>?>(
        future: _fetchUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text(
                "An error occurred while loading profile data.",
                style: TextStyle(color: Colors.red),
              ),
            );
          }
          if (!snapshot.hasData || snapshot.data == null) {
            return const Center(
              child: Text(
                "No profile data found.",
                style: TextStyle(color: Colors.black),
              ),
            );
          }

          final userData = snapshot.data!;
          final String firstName = userData['firstName'] ?? '';
          final String lastName = userData['lastName'] ?? '';

          return Column(
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
                    left: screenWidth * 0.3,
                    child: Column(
                      children: [
                        const CircleAvatar(
                          radius: 60,
                          backgroundImage: AssetImage(
                              'assets/profile/profile1.png'), // Default profile image
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '$firstName $lastName',
                          style: const TextStyle(
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
                            Icon(Icons.shopping_bag,
                                color: Colors.yellow, size: 40),
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
                              offset: const Offset(0, 4),
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
              SizedBox(height: screenHeight * 0.01),
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
          );
        },
      ),
    );
  }
}
