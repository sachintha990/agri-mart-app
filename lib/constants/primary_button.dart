import 'package:agri_mart/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PrimaryButton extends StatelessWidget {

  PrimaryButton({required this.text,required this.onPressed,super.key});
  
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: screenWidth*1, 
              height: screenHeight*0.06, 
              child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: onPressed,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    text,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const SizedBox(width: 8),
                  //Icon(Icons.fast_forward, color: Colors.black),
                  const Icon(
                    MdiIcons.chevronDoubleRight,
                    color: Colors.white,
                    size: 30, // Adjust size to fit your design
                  ),
                ],
              ),
              )
            ),
          );
  }
}