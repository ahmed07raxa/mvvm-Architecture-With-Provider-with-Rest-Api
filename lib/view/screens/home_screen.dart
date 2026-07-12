import 'package:flutter/material.dart';
import 'package:mvvm_architecture_with_provider_with_restapi/utils/routes/app_routes.dart';
import 'package:mvvm_architecture_with_provider_with_restapi/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userPreference = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () {
              userPreference.remove().then((value) {
                Navigator.pushNamed(context, AppRoutes.loginScreen);
              });
            },
            child: Text('Logout'),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Center(child: Text('HOME SCREEN')),
    );
  }
}
