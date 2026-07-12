import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_architecture_with_provider_with_restapi/model/user_model.dart';
import 'package:mvvm_architecture_with_provider_with_restapi/utils/routes/app_routes.dart';
import 'package:mvvm_architecture_with_provider_with_restapi/view_model/user_view_model.dart';

class SplashServices {
  void checkAuthentication(BuildContext context) {
    getUserData()
        .then((value) {
          if (value.token == null || value.token == '') {
            Future.delayed(Duration(seconds: 3));
            Navigator.pushReplacementNamed(context, AppRoutes.loginScreen);
          } else {
            Future.delayed(Duration(seconds: 3));
            Navigator.pushReplacementNamed(context, AppRoutes.homeScreen);
          }
        })
        .onError((error, stackTrace) {
          if (kDebugMode) {
            print(error.toString());
          }
        });
  }

  Future<UserModel> getUserData() => UserViewModel().getUser();
}
