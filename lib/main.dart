import 'package:flutter/material.dart';
import 'package:mvvm_architecture_with_provider_with_restapi/utils/routes/app_routes.dart';
import 'package:mvvm_architecture_with_provider_with_restapi/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => AuthViewModel())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MVVM - Architecture',
        theme: ThemeData(primaryColor: Colors.blue),
        initialRoute: AppRoutes.loginScreen,
        routes: AppRoutes.getRoutes(),
      ),
    );
  }
}
