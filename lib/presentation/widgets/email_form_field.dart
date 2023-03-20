import 'package:auto_motive/app/constants/regx.dart';
import 'package:auto_motive/presentation/resources/assets_manager.dart';
import 'package:flutter/material.dart';

import '../resources/strings_manager.dart';
import 'custom_suffix_icon.dart';

class EmailFormField extends StatelessWidget {
  final TextEditingController emailController;

  const EmailFormField({super.key, required this.emailController});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {},
      validator: (value) {
        if (value!.isEmpty) {
          return AppStrings.emptyString;
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          return AppStrings.emailValidationMSg;
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: AppStrings.email,
        hintText: AppStrings.enterEmail,
        suffixIcon: CustomSurffixIcon(svgIcon: ImageAssets.smsIcon),
      ),
    );
  }
}
