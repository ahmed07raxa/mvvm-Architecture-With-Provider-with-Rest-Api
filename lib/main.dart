import 'package:flutter/material.dart';
import 'package:mvvm_architecture_with_provider_with_restapi/utils/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MVVM - Architecture',
      theme: ThemeData(useMaterial3: true, primaryColor: Colors.blue),
      initialRoute: AppRoutes.loginScreen,
      routes: AppRoutes.getRoutes(),
    );
  }
}
