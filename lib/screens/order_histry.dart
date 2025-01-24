import 'package:agri_mart/constants/bg_ellipse.dart';
import 'package:flutter/material.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({super.key});

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  final List<Map<String, dynamic>> orderData = [
    {"orderNumber": "#12345", "status": "Delivered", "amount": 1500},
    {"orderNumber": "#12341", "status": "Pending", "amount": 2000},
    {"orderNumber": "#14346", "status": "Delivered", "amount": 2000},
    {"orderNumber": "#12356", "status": "Pending", "amount": 2000},
  ];

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    // Filtered order data to show only Pending and Delivered statuses
    final filteredOrderData = orderData
        .where((order) =>
            order['status'] == 'Delivered' || order['status'] == 'Pending')
        .toList();

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              const BgEllipse(), // Background logo at the top
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
                    "Order History",
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
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: filteredOrderData.length,
              itemBuilder: (context, index) {
                final data = filteredOrderData[index];
                return OrderHistoryCard(
                  orderNumber: data['orderNumber'],
                  status: data['status'],
                  amount: data['amount'],
                  onTrackOrder: () {
                    // Navigate to tracking screen or show tracking info
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Tracking order: ${data['orderNumber']}"),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class OrderHistoryCard extends StatelessWidget {
  final String orderNumber;
  final String status;
  final int amount;
  final VoidCallback onTrackOrder;

  const OrderHistoryCard({
    required this.orderNumber,
    required this.status,
    required this.amount,
    required this.onTrackOrder,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey.withOpacity(0.1),
          
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Order: $orderNumber",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              "Status: $status",
              style: TextStyle(
                fontSize: 14,
                color: status == "Delivered"
                    ? Colors.green
                    : Colors.orange, // Pending status in orange
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              "Amount: Rs. $amount",
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: onTrackOrder,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  "Track Order",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
