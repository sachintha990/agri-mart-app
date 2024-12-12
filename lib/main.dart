import 'package:agri_mart/router/router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
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
      //home: SelectSeat(),
      debugShowCheckedModeBanner: false,
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

