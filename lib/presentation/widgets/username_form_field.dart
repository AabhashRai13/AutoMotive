import 'package:auto_motive/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';

import '../resources/assets_manager.dart';
import 'custom_suffix_icon.dart';

class UserNameFormField extends StatelessWidget {
  final TextEditingController userNameController;
  const UserNameFormField({super.key, required this.userNameController});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return AppStrings.emptyString;
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: AppStrings.userName,
        hintText: AppStrings.enterUserName,
        suffixIcon: CustomSurffixIcon(svgIcon: ImageAssets.user),
      ),
    );
  }
}
