import 'package:agri_mart/constants/colors.dart';
import 'package:agri_mart/constants/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  bool _showPassword = false; // For toggling password visibility

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
                      SizedBox(height: screenHeight*0.05,),

                      _buildLabelTextField("Username", (value) {
                        if (value == null || value.isEmpty) {
                          return 'Username is required';
                        }
                        return null;
                      }),
                      SizedBox(height: screenHeight*0.01,),
          
                      _buildLabelTextField("Gmail", (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email is required';
                        } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(value)) {
                          return 'Enter a valid email address';
                        }
                        return null;
                      }, keyboardType: TextInputType.emailAddress),
                      SizedBox(height: screenHeight*0.01,),
          
                      _buildLabelTextField("Password", (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is required';
                        } else if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      }, controller: _passwordController, obscureText: !_showPassword),
                      SizedBox(height: screenHeight*0.05,),
          
                      Center(
                        child: PrimaryButton(text: "Login", onPressed: (){
                            if (_formKey.currentState!.validate()) {
                              // If the form is valid, proceed further
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Login Successful!')),
                              );
                              Get.toNamed('/home');
                            }
                          },)
                      ),
                    ],
                  ),
                
          ),
        ),
      ),
    );
  }

  Widget _buildLabelTextField(String label, String? Function(String?) validator,
      {TextEditingController? controller, TextInputType keyboardType = TextInputType.text, bool obscureText = false}) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            "$label :",
            style: const TextStyle(fontSize: 16),
          ),
        ),
        Expanded(
          flex: 4,
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
                borderRadius: BorderRadius.circular(5),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.green, width: 2),
                borderRadius: BorderRadius.circular(5),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red, width: 1.5),
                borderRadius: BorderRadius.circular(5),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red, width: 2),
                borderRadius: BorderRadius.circular(5),
              ),
              suffixIcon: label == "Password"
                  ? IconButton(
                      icon: Icon(
                        _showPassword ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _showPassword = !_showPassword;
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
