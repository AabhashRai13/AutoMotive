import 'package:auto_motive/presentation/resources/color_manager.dart';
import 'package:auto_motive/presentation/resources/size_config.dart';
import 'package:auto_motive/presentation/widgets/default_button.dart';
import 'package:auto_motive/presentation/widgets/password_form_field.dart';
import 'package:auto_motive/presentation/widgets/username_form_field.dart';
import 'package:flutter/material.dart';

import '../../resources/strings_manager.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key});
  final formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          UserNameFormField(
            userNameController: usernameController,
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          PasswordFormField(
            passwordController: passwordController,
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Checkbox(
                value: false,
                activeColor: ColorManager.primary,
                onChanged: (value) {},
              ),
              const Text(AppStrings.rememberMe),
              const Spacer(),
              GestureDetector(
                onTap: () {
                },
                child: const Text(
                  AppStrings.forgotPassword,
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),

          SizedBox(height: getProportionateScreenHeight(20)),

          // ? const Center(
          //     child: CircularProgressIndicator(),
          //   )
          // :
          DefaultButton(
            text: AppStrings.loginText,
            press: () {},
          ),
        ],
      ),
    );
  }
}
