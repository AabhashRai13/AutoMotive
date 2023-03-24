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
      appBar: AppBar(
        leading: IconButton(
          // color: ColorManager.normalBorderColor,
          icon: Image.asset(ImageAssets.backArrow),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.01),
                Text(
                  AppStrings.quickSignUp,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: ColorManager.kTextColor,
                    fontSize: getProportionateScreenWidth(20),
                    // fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.01),
                const Text(
                  AppStrings.signUpPageText,
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                SignUpForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                Row(children: const <Widget>[
                  Expanded(child: Divider()),
                  Text(AppStrings.orSignUp),
                  Expanded(child: Divider()),
                ]),
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialCard(
                      icon: ImageAssets.appleIcon,
                      press: () {},
                    ),
                    SocialCard(
                      icon: ImageAssets.googleIcon,
                      press: () {},
                    ),
                    SocialCard(
                      icon: ImageAssets.faceBookIcon,
                      press: () {},
                    ),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(AppStrings.haveAnAcountText),
                    SizedBox(width: getProportionateScreenWidth(10)),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        AppStrings.signIn,
                        style: TextStyle(color: ColorManager.primary),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
