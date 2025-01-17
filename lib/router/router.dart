// FILE: router_class.dart
import 'package:agri_mart/screens/get_started.dart';
import 'package:agri_mart/screens/login.dart';
import 'package:agri_mart/screens/sign_up.dart';
import 'package:agri_mart/screens/user_panel/home.dart';
import 'package:get/get.dart';

class RouterClass {
  List<GetPage> get routes => [
        GetPage(
          name: '/',
          page: () => const GetStarted(),
        ),
        GetPage(
          name: '/signup',
          page: () => const SignUp(),
        ),
        GetPage(
          name: '/login',
          page: () => const Login(),
        ),
        GetPage(
          name: '/home',
          page: () => Home(),
        ),
      ];
}
