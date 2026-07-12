import 'package:flutter/material.dart';
import 'package:mvvm_architecture_with_provider_with_restapi/view/screens/home_screen.dart';
import 'package:mvvm_architecture_with_provider_with_restapi/view/screens/login_screen.dart';
import 'package:mvvm_architecture_with_provider_with_restapi/view/screens/sign_up_screen.dart';
import 'package:mvvm_architecture_with_provider_with_restapi/view/screens/splash_screen.dart';

class AppRoutes {
  static const splashScreen = "/splashScreen";
  static const loginScreen = "/loginScreen";
  static const signUpScreen = "/signUpScreen";
  static const homeScreen = "/homeScreen";

  static Map<String, Widget Function(BuildContext)> getRoutes() => {
    splashScreen: (context) => SplashScreen(),
    loginScreen: (context) => LoginScreen(),
    signUpScreen: (context) => SignUpScreen(),
    homeScreen: (context) => HomeScreen(),
  };
}
