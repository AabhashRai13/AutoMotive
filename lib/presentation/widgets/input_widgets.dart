import 'package:auto_motive/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';

import '../resources/assets_manager.dart';
import 'custom_suffix_icon.dart';

class InputFields extends StatelessWidget {
  final bool isRequired;
  final TextEditingController inputController;
  final String? validationMsg;
  final String? hintText;
  final String? labelText;
  final String? icon;
  const InputFields(
      {super.key,
      required this.inputController,
      required this.isRequired,
      this.validationMsg,
      this.hintText,
      this.labelText,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: inputController,
      onChanged: (value) {
        return;
      },
      validator: (value) {
        if (isRequired && value!.isEmpty) {
          return validationMsg ?? AppStrings.emptyString;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: labelText ?? AppStrings.emptyString,
        hintText: hintText ?? AppStrings.emptyString,
        suffixIcon: icon == ""
            ? const CustomSurffixIcon(svgIcon: ImageAssets.user)
            : null,
      ),
    );
  }
}
