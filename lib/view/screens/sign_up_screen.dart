import 'package:flutter/material.dart';
import 'package:mvvm_architecture_with_provider_with_restapi/resources/components/round_button.dart';
import 'package:mvvm_architecture_with_provider_with_restapi/utils/routes/app_routes.dart';
import 'package:mvvm_architecture_with_provider_with_restapi/utils/utils.dart';
import 'package:mvvm_architecture_with_provider_with_restapi/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();

  FocusNode passwordFocusNode = FocusNode();

  ValueNotifier<bool> toggle = ValueNotifier<bool>(true);

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(title: Text('SIGN UP'), centerTitle: true),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                focusNode: emailFocusNode,
                decoration: InputDecoration(hintText: "Email"),
                onFieldSubmitted: (value) {
                  Utils.fieldFocusChange(
                    context,
                    emailFocusNode,
                    passwordFocusNode,
                  );
                },
              ),
              ValueListenableBuilder(
                valueListenable: toggle,
                builder: (context, value, child) {
                  return TextFormField(
                    controller: _passwordController,
                    obscureText: toggle.value,
                    focusNode: passwordFocusNode,
                    decoration: InputDecoration(
                      hintText: "Password",
                      suffixIcon: GestureDetector(
                        onTap: () {
                          toggle.value = !toggle.value;
                        },
                        child: Icon(
                          toggle.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: height * .085),
              RoundButton(
                text: "Sign Up",
                loading: authViewModel.loading,
                onTap: () {
                  if (_emailController.text.isEmpty) {
                    Utils.flushBarErrorMessage("Please enter email", context);
                  } else if (_passwordController.text.isEmpty) {
                    Utils.flushBarErrorMessage(
                      "Please enter password",
                      context,
                    );
                  } else if (_passwordController.text.length < 6) {
                    Utils.flushBarErrorMessage(
                      "Please enter 8 digits password",
                      context,
                    );
                  } else {
                    Map<String, dynamic> data = {
                      'email': _emailController.text.toString(),
                      'password': _passwordController.text.toString(),
                    };
                    authViewModel.registerApi(data, context);
                  }
                },
              ),
              SizedBox(height: height * .02),
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, AppRoutes.loginScreen);
                },
                child: Text('Already have account? Login'))
            ],
          ),
        ),
      ),
    );
  }
}