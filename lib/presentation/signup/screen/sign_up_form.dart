import 'package:auto_motive/presentation/resources/color_manager.dart';
import 'package:auto_motive/presentation/resources/routes_manager.dart';
import 'package:auto_motive/presentation/resources/size_config.dart';
import 'package:auto_motive/presentation/signup/bloc/sign_up_bloc.dart';
import 'package:auto_motive/presentation/widgets/confirm_password_form_field.dart';
import 'package:auto_motive/presentation/widgets/default_button.dart';
import 'package:auto_motive/presentation/widgets/email_form_field.dart';
import 'package:auto_motive/presentation/widgets/password_form_field.dart';
import 'package:auto_motive/presentation/widgets/username_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    bool loading = false;

    return Form(
      key: formKey,
      child: BlocConsumer<SignUpBloc, SignUpState>(
        listener: (context, state) {
          if (state is Loading) {
            loading = true;
          } else if (state is Loaded) {
            loading = true;
            Navigator.pushReplacementNamed(
                context, Routes.addLicensePlateScreen);
          } else if (state is Error) {
            loading = false;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          } else {
            loading = false;
          }
        },
        builder: (context, state) {
          return Column(
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
                      Navigator.pushNamed(context, Routes.signInWithNumber);
                    },
                    child: const Text(
                      AppStrings.signInWithNumber,
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                  )
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(20)),
              DefaultButton(
                loading: loading,
                text: AppStrings.signUp,
                press: () {
                  if (formKey.currentState!.validate()) {
                    context.read<SignUpBloc>().add(SignUp(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                        phone: usernameController.text.trim()));
                  }
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
