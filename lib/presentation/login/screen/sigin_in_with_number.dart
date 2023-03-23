import 'package:auto_motive/app/di.dart';
import 'package:auto_motive/presentation/login/bloc/sign_in_bloc.dart';
import 'package:auto_motive/presentation/resources/color_manager.dart';
import 'package:auto_motive/presentation/resources/routes_manager.dart';
import 'package:auto_motive/presentation/resources/size_config.dart';
import 'package:auto_motive/presentation/resources/strings_manager.dart';
import 'package:auto_motive/presentation/widgets/default_button.dart';
import 'package:auto_motive/presentation/widgets/username_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class SignInWithNumber extends StatelessWidget {
  SignInWithNumber({super.key});
  final TextEditingController phoneNumberController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool loading = false;
  final SignInBloc _signInBloc = sl<SignInBloc>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: BlocConsumer<SignInBloc, SignInState>(
          bloc: _signInBloc,
          listener: (context, state) {
            if (state is Error) {
              loading = false;
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Otp Not Sent")),
              );
            } else if (state is OtpSent) {
              loading = false;
              Navigator.pushNamed(context, Routes.otpScreen,
                  arguments: phoneNumberController.text.trim());
            } else if (state is Loading) {
              loading = true;
            }
          },
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.05),
                UserNameFormField(
                  userNameController: phoneNumberController,
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                Text(
                  AppStrings.signUpScreenText2,
                  style: TextStyle(color: ColorManager.normalBorderColor),
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                DefaultButton(
                  loading: loading,
                  text: AppStrings.signIn,
                  press: loading
                      ? () {}
                      : () {
                          if (formKey.currentState!.validate()) {
                            _signInBloc.add(SignInWithOtp(
                                phoneNumber:
                                    phoneNumberController.text.trim()));
                          }
                        },
                ),
              ],
            );
          },
        ));
  }
}
