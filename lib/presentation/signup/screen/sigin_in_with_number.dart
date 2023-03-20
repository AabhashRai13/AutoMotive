import 'package:auto_motive/presentation/login/bloc/sign_in_bloc.dart';
import 'package:auto_motive/presentation/resources/color_manager.dart';
import 'package:auto_motive/presentation/resources/routes_manager.dart';
import 'package:auto_motive/presentation/resources/size_config.dart';
import 'package:auto_motive/presentation/resources/strings_manager.dart';
import 'package:auto_motive/presentation/widgets/default_button.dart';
import 'package:auto_motive/presentation/widgets/input_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class SignInWithNumber extends StatelessWidget {
  SignInWithNumber({super.key});
  final TextEditingController phoneNumberController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.emptyString),
      ),
      body: SafeArea(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Form(
              key: formKey,
              child: BlocConsumer<SignInBloc, SignInState>(
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: SizeConfig.screenHeight * 0.1),
                      Text(
                        AppStrings.automotiveText,
                        style: TextStyle(
                          color: ColorManager.primary,
                          fontSize: getProportionateScreenWidth(28),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: getProportionateScreenHeight(30)),
                      const Text(
                        AppStrings.addPhoneNumberText,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: getProportionateScreenHeight(30)),
                      InputFields(
                        inputController: phoneNumberController,
                        isRequired: true,
                        validationMsg: AppStrings.addPhoneNumberValidationError,
                        labelText: AppStrings.phoneNumberLabe,
                        hintText: AppStrings.addPhoneNumberText,
                      ),
                      SizedBox(height: getProportionateScreenHeight(60)),
                      DefaultButton(
                        loading: loading,
                        text: AppStrings.continueText,
                        press: loading
                            ? () {}
                            : () {
                                if (formKey.currentState!.validate()) {
                                  context.read<SignInBloc>().add(SignInWithOtp(
                                      phoneNumber:
                                          phoneNumberController.text.trim()));
                                }
                              },
                      ),
                    ],
                  );
                },
              )),
        ),
      ),
    );
  }
}
