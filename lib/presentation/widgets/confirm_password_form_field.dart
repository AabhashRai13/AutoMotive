import 'package:auto_motive/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';

class ConfirmPasswordFormField extends StatelessWidget {
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  const ConfirmPasswordFormField(
      {super.key,
      required this.passwordController,
      required this.confirmPasswordController});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: confirmPasswordController,
      obscureText: true,
      validator: (value) {
        if (value!.isEmpty) {
          return "";
        } else if (confirmPasswordController != passwordController) {
          return AppStrings.passwordNotMatch;
        }

        return null;
      },
      decoration: const InputDecoration(
        labelText: AppStrings.confirmPassword,
        hintText: AppStrings.enterPassword,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        //  suffixIcon: CustomSurffixIcon(svgIcon: ImageAssets.lockIcon),
      ),
    );
  }
}
