import 'package:flutter/material.dart';
import 'package:mvvm_architecture_with_provider_with_restapi/utils/routes/app_routes.dart';
import 'package:mvvm_architecture_with_provider_with_restapi/utils/utils.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              Utils.flushBarErrorMessage('messageasdsda', context);
            },
            child: Text('CLICK'),
          ),
        ],
      ),
    );
  }
}
