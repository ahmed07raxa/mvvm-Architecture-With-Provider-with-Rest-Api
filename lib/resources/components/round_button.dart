import 'package:flutter/material.dart';
import 'package:mvvm_architecture_with_provider_with_restapi/resources/app_colors.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({
    super.key,
    required this.text,
    this.loading = false,
    required this.onTap,
  });
  final String text;
  final bool loading;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 200,
        decoration: BoxDecoration(
          color: AppColors.buttonBgColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: loading
              ? CircularProgressIndicator()
              : Text(text, style: TextStyle(color: AppColors.whiteColor)),
        ),
      ),
    );
  }
}
