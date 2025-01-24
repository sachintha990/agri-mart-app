import 'package:flutter/material.dart';

class InvoiceScreen extends StatelessWidget {
  final List<Map<String, dynamic>> orderItems = [
    {
      'item': 'Carrot',
      'amountPerUnit': 240.00,
      'weight': '1Kg',
      'amount': 240.00,
    },
    {
      'item': 'Beans',
      'amountPerUnit': 240.00,
      'weight': '1Kg',
      'amount': 240.00,
    },
    {
      'item': 'Potato',
      'amountPerUnit': 240.00,
      'weight': '1Kg',
      'amount': 240.00,
    },
  ];

  double calculateTotalAmount() {
    return orderItems.fold(0, (sum, item) => sum + item['amount']);
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/logo.png',
                      height: 100,
                    ),
                    Column(
                      children: [
                        Text(
                          'agrimart@gmail.com',
                          style: TextStyle(fontSize: 12),
                        ),
                        Text(
                          'Passara Road, Badulla',
                          style: TextStyle(fontSize: 12),
                        ),
                        Text(
                          '222 555 7777 | agrimart',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    )
                  ],
                ),
                Divider(
                  color: Colors.green,
                  thickness: 10,
                ),
                // Invoice Title
                Text(
                  'Invoice',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                // Invoice Details
                Row(
                  children: [
                    Text('Invoice Date: ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('March 01, 2025'),
                  ],
                ),
                Row(
                  children: [
                    Text('Invoice Number: ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(' INV-2025-001'),
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                Row(
                  children: [
                    Text('Client Name: ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(' Ashen Eranga'),
                  ],
                ),
                Row(
                  children: [
                    Text('Client Address:',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(' Passara Road, Badulla'),
                  ],
                ),
                Row(
                  children: [
                    Text('Client Contact:',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(' 0717903462'),
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                // Table
                Table(
                  border: TableBorder.all(color: Colors.grey),
                  columnWidths: {
                    0: FlexColumnWidth(2),
                    1: FlexColumnWidth(1),
                    2: FlexColumnWidth(1),
                    3: FlexColumnWidth(1),
                  },
                  children: [
                    // Header Row
                    TableRow(
                      decoration: BoxDecoration(color: Colors.grey.shade200),
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Item',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Amount per Unit',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Weight',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Amount',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                    // Order Items
                    ...orderItems.map((item) {
                      return TableRow(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(item['item']),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                                '${item['amountPerUnit'].toStringAsFixed(2)}'),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(item['weight']),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('${item['amount'].toStringAsFixed(2)}'),
                          ),
                        ],
                      );
                    }).toList(),
                    // Total Row
                    TableRow(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Total Amount',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Padding(padding: EdgeInsets.all(8.0), child: Text('')),
                        Padding(padding: EdgeInsets.all(8.0), child: Text('')),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                              '${calculateTotalAmount().toStringAsFixed(2)}'),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                // Payment Due Date
                Text('Payment Due By: March 15, 2025'),
                SizedBox(height: screenHeight * 0.02),
                // Contact Information
                Text(
                  'For any Questions, please contact Agrimart agent at agrimart@gmail.com',
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                ),
                Spacer(),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Add your onPressed code here!
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green, // background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8), // radius
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32.0, vertical: 16.0),
                      child:
                          Text('Done', style: TextStyle(color: Colors.black)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
