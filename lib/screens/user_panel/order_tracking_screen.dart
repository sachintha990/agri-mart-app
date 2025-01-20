import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrderTrackingScreen extends StatefulWidget {
  @override
  State<OrderTrackingScreen> createState() => _OrderTrackingScreenState();
}

class _OrderTrackingScreenState extends State<OrderTrackingScreen> {
  late GoogleMapController mapController;

  // Initial position for the map
  final LatLng _initialPosition =
      LatLng(37.7749, -122.4194); // Example: San Francisco

  // Example delivery route
  final List<LatLng> _deliveryRoute = [
    LatLng(37.7749, -122.4194), // Start point
    LatLng(37.7849, -122.4094), // Midpoint
    LatLng(37.7949, -122.3994), // Destination
  ];

  Set<Polyline> _createRoute() {
    return {
      Polyline(
        polylineId: PolylineId("delivery_route"),
        points: _deliveryRoute,
        color: Colors.green,
        width: 5,
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          "Order Tracking",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: _initialPosition,
                zoom: 14,
              ),
              onMapCreated: (controller) {
                mapController = controller;
              },
              polylines: _createRoute(),
            ),
          ),
          Container(
            color: Colors.green.shade100,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Call and Message Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        // Handle call action
                      },
                      icon: const Icon(Icons.call),
                      label: const Text("Call"),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        // Handle message action
                      },
                      icon: const Icon(Icons.message),
                      label: const Text("Message"),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Status Steps
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildStatusStep("Order Received", isActive: true),
                    _buildStatusStep("On the Way", isActive: true),
                    _buildStatusStep("Delivered", isActive: false),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget for the status step
  Widget _buildStatusStep(String text, {required bool isActive}) {
    return Column(
      children: [
        CircleAvatar(
          radius: 12,
          backgroundColor: isActive ? Colors.green : Colors.grey,
          child: isActive
              ? const Icon(Icons.check, color: Colors.white, size: 16)
              : const SizedBox.shrink(),
        ),
        const SizedBox(height: 4),
        Text(
          text,
          style: TextStyle(
            color: isActive ? Colors.green : Colors.grey,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
