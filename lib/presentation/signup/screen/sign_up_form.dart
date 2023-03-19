import 'package:auto_motive/presentation/resources/color_manager.dart';
import 'package:auto_motive/presentation/resources/size_config.dart';
import 'package:auto_motive/presentation/widgets/confirm_password_form_field.dart';
import 'package:auto_motive/presentation/widgets/default_button.dart';
import 'package:auto_motive/presentation/widgets/email_form_field.dart';
import 'package:auto_motive/presentation/widgets/password_form_field.dart';
import 'package:auto_motive/presentation/widgets/username_form_field.dart';
import 'package:flutter/material.dart';

import '../../resources/strings_manager.dart';

class SignUpForm extends StatelessWidget {
  SignUpForm({super.key});
  final formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          EmailFormField(
            emailController: emailController,
          ),
          SizedBox(height: getProportionateScreenHeight(15)),
          UserNameFormField(
            userNameController: usernameController,
          ),
          SizedBox(height: getProportionateScreenHeight(15)),
          PasswordFormField(
            passwordController: passwordController,
          ),

          SizedBox(height: getProportionateScreenHeight(15)),
          ConfirmPasswordFormField(
            passwordController: passwordController,
            confirmPasswordController: confirmPasswordController,
          ),

          SizedBox(height: getProportionateScreenHeight(15)),
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
                  //  Navigator.pushNamed(context, ForgotPasswordScreen.routeName);
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
