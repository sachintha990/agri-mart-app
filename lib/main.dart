import 'package:agri_mart/router/router.dart';
import 'package:agri_mart/screens/get_started.dart';
import 'package:agri_mart/screens/user_panel/cart_screen.dart';
import 'package:agri_mart/screens/user_panel/chat_screen.dart';
import 'package:agri_mart/screens/user_panel/message_section.dart';
import 'package:agri_mart/screens/user_panel/order_confirmation_screen.dart';
import 'package:agri_mart/screens/user_panel/product_detail_screen.dart';
import 'package:agri_mart/screens/user_panel/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const AgriMart());
}

class AgriMart extends StatelessWidget {
  const AgriMart({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        fontFamily: "Poppins",
      ),
      debugShowCheckedModeBanner: false,
      home: GetStarted(),
      initialRoute: '/',
      getPages: RouterClass().routes,
      unknownRoute: GetPage(
        name: '/notfound',
        page: () => const Scaffold(
          body: Center(
            child: Text('This Page Not Found!'),
          ),
        ),
      ),
    );
  }
}
