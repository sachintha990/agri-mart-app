import 'package:agri_mart/constants/colors.dart';
import 'package:flutter/material.dart';

class BgEllipse extends StatelessWidget {
  const BgEllipse({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
            clipper: TopCurveClipper(),
            child: Container(
              color: primaryColor,
              height: MediaQuery.of(context).size.height * 0.3,
              width: double.infinity,
            ),
          );
  }
}

// Correctly Implemented TopCurveClipper
class TopCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height * 0.5);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height * 0.5,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}