import 'package:auto_motive/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';

class PasswordFormField extends StatelessWidget {
  final TextEditingController passwordController;
  const PasswordFormField({super.key,required this.passwordController});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: passwordController,
      obscureText: true,
      validator: (value) {
        if (value!.isEmpty) {
          return "";
        } else if (value.length < 6) {
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: AppStrings.password,
        hintText: AppStrings.enterPassword,
        //  suffixIcon: CustomSurffixIcon(svgIcon: ImageAssets.lockIcon),
      ),
    );
  }
}
