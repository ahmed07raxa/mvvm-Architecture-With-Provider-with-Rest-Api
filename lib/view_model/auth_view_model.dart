import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_architecture_with_provider_with_restapi/repository/auth_repository.dart';
import 'package:mvvm_architecture_with_provider_with_restapi/utils/utils.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();

  bool _loading = false;
  bool get loading => _loading;

  void setLoading(bool value) {
    _loading = value;
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    _myRepo
        .loginApi(data)
        .then((value) {
          if (kDebugMode) {
            print(value.toString());
          }
        })
        .onError((error, stackTrace) {
          if (kDebugMode) {
            Utils.flushBarErrorMessage(error.toString(), context);
            print(error.toString());
          }
        });
  }
}
