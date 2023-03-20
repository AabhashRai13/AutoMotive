import 'package:auto_motive/presentation/resources/assets_manager.dart';
import 'package:auto_motive/presentation/resources/color_manager.dart';
import 'package:auto_motive/presentation/resources/size_config.dart';
import 'package:auto_motive/presentation/resources/strings_manager.dart';
import 'package:auto_motive/presentation/signup/screen/sign_up_form.dart';
import 'package:auto_motive/presentation/widgets/social_cards.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: SizeConfig.screenHeight * 0.04),
                  Text(
                    AppStrings.automotiveText,
                    style: TextStyle(
                      color: ColorManager.primary,
                      fontSize: getProportionateScreenWidth(28),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    AppStrings.signUpPageText,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.08),
                  SignUpForm(),
                  SizedBox(height: SizeConfig.screenHeight * 0.08),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialCard(
                        icon: ImageAssets.googleIcon,
                        press: () {},
                      ),
                      SocialCard(
                        icon: ImageAssets.faceBookIcon,
                        press: () {},
                      ),
                      SocialCard(
                        icon: ImageAssets.instagramIcon,
                        press: () {},
                      ),
                    ],
                  ),
                  SizedBox(height: getProportionateScreenHeight(20)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
