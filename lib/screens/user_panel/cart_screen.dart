import 'package:agri_mart/constants/user_panel/custom_app_bar.dart';
import 'package:agri_mart/constants/user_panel/home/today_price_card.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final List<CartItem> cartItems = [
    CartItem(name: 'Carrot', image: 'assets/images/carrot.png', price: 240.00, weight: '1 kg', quantity: 1),
    CartItem(name: 'Beans', image: 'assets/images/beans.png', price: 200.00, weight: '1 kg', quantity: 1),
    CartItem(name: 'Potato', image: 'assets/images/potato.png', price: 180.00, weight: '1 kg', quantity: 1),
    CartItem(name: 'Beans', image: 'assets/images/beans.png', price: 210.00, weight: '1 kg', quantity: 1),
  ];

  double calculateTotal() {
    return cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              CustomAppBar(),
              SizedBox(height: screenHeight*0.03,),
              Expanded(
                child: ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    final item = cartItems[index];
                    return SingleChildScrollView(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Product Image
                           ProductCard(imageUrl: 'assets/product/beans.png', productName: 'Beans', price: ''),
                          const SizedBox(width: 16),
                          // Product Details
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.name,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  item.weight,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (item.quantity > 1) item.quantity--;
                                        });
                                      },
                                      child: const Icon(Icons.remove_circle_outline, color: Colors.green),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Text(
                                        '${item.quantity}',
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          item.quantity++;
                                        });
                                      },
                                      child: const Icon(Icons.add_circle_outline, color: Colors.green),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          // Price
                          Text(
                            'LKR ${(item.price * item.quantity).toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              
              // Total and Place Order Button
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.black.withOpacity(0.8))),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total:',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'LKR ${calculateTotal().toStringAsFixed(2)}',
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        // Place order logic
                      },
                      child: const Text(
                        'Place Order',
                        style: TextStyle(fontSize: 16,color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CartItem {
  final String name;
  final String image;
  final double price;
  late final String weight;
  int quantity;

  CartItem({
    required this.name,
    required this.image,
    required this.price,
    required this.weight,
    this.quantity = 1,
  });
}
