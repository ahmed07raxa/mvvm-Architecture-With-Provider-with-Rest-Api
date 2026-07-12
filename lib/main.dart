import 'package:flutter/material.dart';
import 'package:mvvm_architecture_with_provider_with_restapi/utils/routes/app_routes.dart';
import 'package:mvvm_architecture_with_provider_with_restapi/view_model/auth_view_model.dart';
import 'package:mvvm_architecture_with_provider_with_restapi/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthViewModel()),
        ChangeNotifierProvider(create: (context) => UserViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MVVM - Architecture',
        theme: ThemeData(primarySwatch: Colors.blue),
        initialRoute: AppRoutes.splashScreen,
        routes: AppRoutes.getRoutes(),
      ),
    );
  }
}
