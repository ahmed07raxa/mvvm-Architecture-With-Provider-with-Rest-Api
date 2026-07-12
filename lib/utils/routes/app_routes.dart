import 'package:flutter/material.dart';
import 'package:mvvm_architecture_with_provider_with_restapi/view/screens/home_screen.dart';
import 'package:mvvm_architecture_with_provider_with_restapi/view/screens/login_screen.dart';

class AppRoutes {
  static const loginScreen = "/loginScreen";
  static const homeScreen = "/homeScreen";

  static Map<String, Widget Function(BuildContext)> getRoutes() => {
    loginScreen: (context) => LoginScreen(),
    homeScreen: (context) => HomeScreen(),
  };
}
