import 'package:agri_mart/constants/colors.dart';
import 'package:agri_mart/constants/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: screenHeight * 0.75,
      width: screenWidth * 0.8,
      decoration: BoxDecoration(
        color: boxColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: screenHeight * 0.03,
                ),
                _buildLabelTextField("First name", (value) {
                  if (value == null || value.isEmpty) {
                    return 'First name is required';
                  }
                  return null;
                }),
                SizedBox(height: screenHeight * 0.01),
                _buildLabelTextField("Last name", (value) {
                  if (value == null || value.isEmpty) {
                    return 'Last name is required';
                  }
                  return null;
                }),
                SizedBox(height: screenHeight * 0.01),
                _buildLabelTextField("Telephone", (value) {
                  if (value == null || value.isEmpty) {
                    return 'Phone number is required';
                  } else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                    return 'Enter a valid 10-digit phone number';
                  }
                  return null;
                }, keyboardType: TextInputType.phone),
                SizedBox(height: screenHeight * 0.01),
                _buildLabelTextField("Address", (value) {
                  if (value == null || value.isEmpty) {
                    return 'Address is required';
                  }
                  return null;
                }),
                SizedBox(height: screenHeight * 0.01),
                _buildLabelTextField("Gmail", (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email is required';
                  } else if (!RegExp(
                          r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                      .hasMatch(value)) {
                    return 'Enter a valid email address';
                  }
                  return null;
                }, keyboardType: TextInputType.emailAddress),
                SizedBox(height: screenHeight * 0.01),
                _buildLabelTextField("Password", (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password is required';
                  } else if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    showPasswordToggle: true),
                SizedBox(height: screenHeight * 0.01),
                _buildLabelTextField("Conform", (value) {
                  if (value == null || value.isEmpty) {
                    return 'Confirm password is required';
                  } else if (value != _passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
                    controller: _confirmPasswordController,
                    obscureText: _obscurePassword,
                    showPasswordToggle: true),
                SizedBox(height: screenHeight * 0.05),
                Center(
                  child: PrimaryButton(
                      text: "Sign Up",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Get.toNamed('/login');
                        }
                      }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Alerady have an account?",
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.toNamed('/login');
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(fontSize: 16, color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLabelTextField(String label, String? Function(String?) validator,
      {TextEditingController? controller,
      TextInputType keyboardType = TextInputType.text,
      bool obscureText = false,
      bool showPasswordToggle = false}) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Text(
            "$label :",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          flex: 6,
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            obscureText: obscureText,
            decoration: InputDecoration(
              isDense: true,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.green, width: 1.5),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.green, width: 2),
                borderRadius: BorderRadius.circular(15),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red, width: 1.5),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red, width: 2),
                borderRadius: BorderRadius.circular(15),
              ),
              // Add suffix icon for "Show Password" toggle
              suffixIcon: showPasswordToggle
                  ? IconButton(
                      icon: Icon(obscureText
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    )
                  : null,
            ),
            validator: validator,
          ),
        ),
      ],
    );
  }
}
