// FILE: router_class.dart
import 'package:agri_mart/screens/get_started.dart';
import 'package:agri_mart/screens/login.dart';
import 'package:agri_mart/screens/sign_up.dart';
import 'package:agri_mart/screens/user_panel/cart_screen.dart';
import 'package:agri_mart/screens/user_panel/chat_screen.dart';
import 'package:agri_mart/screens/user_panel/fruits_screen.dart';
import 'package:agri_mart/screens/user_panel/home.dart';
import 'package:agri_mart/screens/user_panel/message_section.dart';
import 'package:agri_mart/screens/user_panel/others_screen.dart';
import 'package:agri_mart/screens/user_panel/product_screen.dart';
import 'package:agri_mart/screens/user_panel/profile_screen.dart';
import 'package:agri_mart/screens/user_panel/todays_price_screen.dart';
import 'package:agri_mart/screens/user_panel/vegetables_screen.dart';
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
        GetPage(name: '/user_panel/profile', page:() => ProfileScreen()),
        GetPage(name: '/user_panel/cart', page:() => CartScreen()),
        GetPage(name: '/user_panel/vegetables', page:() => VegetablesScreen()),
        GetPage(name: '/user_panel/fruites', page:() => FruitsScreen()),
        GetPage(name: '/user_panel/others', page:() => OthersScreen()),
        GetPage(name: '/user_panel/today_price', page:() => TodaysPriceScreen()),
        GetPage(name: '/user_panel/message', page:() => MessageSection()),
        GetPage(name: '/user_panel/chat', page:() => ChatScreen()),
        GetPage(name: '/user_panel/product', page:() => ProductScreen()),
      ];
}
