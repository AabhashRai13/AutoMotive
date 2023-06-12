import 'package:auto_motive/app/constants/regx.dart';
import 'package:auto_motive/presentation/resources/size_config.dart';
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
      controller: userNameController,
      onChanged: (value) {
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return AppStrings.usernameValidationMSg;
        } else if (!phoneValidation.hasMatch(value)) {
          return AppStrings.phoneValidationMSg;
        }
        return null;
      },
      decoration: InputDecoration(
        label: SizedBox(
          width: getProportionateScreenWidth(65),
          child:const Row(
            children:  [
              Text(AppStrings.phone),
              Text(
                " *",
                style: TextStyle(color: Colors.red),
              )
            ],
          ),
        ),
        hintText: AppStrings.enterPhoneNumber,
        prefixIcon: const CustomSurffixIcon(
          isPhoneNumber: true,
          svgIcon: ImageAssets.auIcon,
          leftPadding: 20,
          rightPadding: 4,
        ),
      ),
    );
  }
}
