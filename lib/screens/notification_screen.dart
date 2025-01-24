import 'package:agri_mart/constants/bg_ellipse.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                // Background logo
                const BgEllipse(),
                Positioned(
                  top: 50,
                  left: 20,
                  child: IconButton(
                    icon: const CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.arrow_back, color: Colors.green),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Positioned(
                  top: screenHeight * 0.1,
                  left: 0,
                  right: 0,
                  child: const Center(
                    child: Text(
                      "Notification",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Notification List
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _buildNotificationItem(
                    message: "You Have New Message",
                    date: _selectedDate.toString().substring(0, 10),
                  ),
                  const SizedBox(height: 20),
                  _buildNotificationItem(
                    message: "You Have New Message",
                    date: _selectedDate.toString().substring(0, 10),
                  ),
                  const SizedBox(height: 20),
                  _buildNotificationItem(
                    message: "You Have New Message",
                    date: _selectedDate.toString().substring(0, 10),
                  ),
                  
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationItem({
    required String message,
    required String date,
  }) {
    return Container(
      width: 350,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color:Colors.grey.withOpacity(0.5),
      ),
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey.withOpacity(0.8),
            ),
            child: const Icon(
              Icons.notifications_active,
              color: Colors.black,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  message,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  date,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff221557),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
