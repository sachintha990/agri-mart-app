import 'package:agri_mart/constants/bg_ellipse.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrderTrackingScreen extends StatefulWidget {
  @override
  State<OrderTrackingScreen> createState() => _OrderTrackingScreenState();
}

class _OrderTrackingScreenState extends State<OrderTrackingScreen> {
  late GoogleMapController mapController;

  // Initial position for Badulla, Sri Lanka
  final LatLng _initialPosition = LatLng(6.9891, 81.0561);

  // Example delivery route
  final List<LatLng> _deliveryRoute = [
    LatLng(6.9891, 81.0561), // Start: Badulla
    LatLng(6.9921, 81.0515), // Midpoint
    LatLng(6.9951, 81.0495), // Destination
  ];

  // Function to create polyline for the route
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
    final double screenHeight = MediaQuery.of(context).size.height;
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
                    "Order Tracking",
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
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: _initialPosition,
                zoom: 14,
              ),
              onMapCreated: (controller) {
                mapController = controller; // Assign the map controller
              },
              polylines: _createRoute(), // Add the polyline route
              markers: {
                Marker(
                  markerId: MarkerId("start"),
                  position: _deliveryRoute.first,
                  infoWindow: InfoWindow(title: "Start: Badulla"),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueGreen,
                  ),
                ),
                Marker(
                  markerId: MarkerId("destination"),
                  position: _deliveryRoute.last,
                  infoWindow: InfoWindow(title: "Destination"),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueRed,
                  ),
                ),
              }, // Add markers for start and destination
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
                      icon: const Icon(Icons.call, color: Colors.black),
                      label: const Text("Call",
                          style: TextStyle(color: Colors.black)),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        // Handle message action
                      },
                      icon: const Icon(Icons.message, color: Colors.black),
                      label: const Text("Message",
                          style: TextStyle(color: Colors.black)),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Status Steps
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildStatusStep("Order Received", isActive: true),
                    _buildStatusStep("On the Way", isActive: false),
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
