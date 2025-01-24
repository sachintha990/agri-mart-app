
import 'package:agri_mart/constants/bg_ellipse.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Stack(
                children: [
                 
                  BgEllipse(),
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
                      )),
                  Positioned(
                    top: screenHeight * 0.1,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        Text(
                          "Payment Details",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Image.asset(
                          "assets/credit_card.png",
                          height: screenHeight * 0.15,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Column(
                            children: [
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Cardholder Name',
                                  labelStyle: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(height: screenHeight*0.025,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                        labelText: 'Card Number',
                                        labelStyle: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Image.asset(
                                      'assets/card_logo.png',
                                      width: 30,
                                      height: 30,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: screenHeight*0.025,),
                              Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        labelText: 'Expiry Date',
                                        labelStyle: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                        labelText: '3-digit CVV',
                                        labelStyle: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: screenHeight*0.025,),
                              TextFormField(
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                              
                                  labelText: 'Total Amount',
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: screenHeight*0.15,),
                          
                          Column(
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(double.infinity*0.5, 50),
                                  backgroundColor: Colors.green,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                onPressed: () {},
                                child: const Text(
                                  "Cancel",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: screenHeight*0.01
                              ),
                              ElevatedButton(
                                
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(double.infinity*0.5, 50),
                                  backgroundColor: Colors.green,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                onPressed: () {},
                                child: const Text(
                                  "Pay",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
