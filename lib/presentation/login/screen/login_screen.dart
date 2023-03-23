import 'package:auto_motive/presentation/login/screen/sigin_in_with_number.dart';
import 'package:auto_motive/presentation/login/screen_switch_bloc/switch_screen_bloc.dart';
import 'package:auto_motive/presentation/resources/assets_manager.dart';
import 'package:auto_motive/presentation/resources/color_manager.dart';
import 'package:auto_motive/presentation/resources/size_config.dart';
import 'package:auto_motive/presentation/resources/strings_manager.dart';
import 'package:auto_motive/presentation/selection_button/screen/selection_button.dart';
import 'package:auto_motive/presentation/widgets/no_account_text.dart';
import 'package:auto_motive/presentation/widgets/social_cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ScreenSwitchBloc>().add(const SignInWithPhoneMethod());
  }

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
              child: BlocBuilder<ScreenSwitchBloc, SwitchScreenState>(
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: SizeConfig.screenHeight * 0.06),
                      Text(
                        AppStrings.welcomeBack,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: getProportionateScreenWidth(18),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: SizeConfig.screenHeight * 0.02),
                      const Text(
                        AppStrings.signInPageText,
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(height: SizeConfig.screenHeight * 0.08),
                      Container(
                        decoration: BoxDecoration(
                            color: ColorManager.blueBackground,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8))),
                        height: getProportionateScreenHeight(50),
                        width: double.infinity,
                        child: SelectionButton(
                          option: const [AppStrings.phone, AppStrings.email],
                        ),
                      ),
                      state is SignInWithPhone
                          ? SignInWithNumber()
                          : state is SignInWithEmail
                              ? LoginForm()
                              : const SizedBox.shrink(),
                      SizedBox(height: SizeConfig.screenHeight * 0.08),
                      Row(children: <Widget>[
                        const Expanded(child: Divider()),
                        Text(
                          AppStrings.orSignIn,
                          style:
                              TextStyle(color: ColorManager.normalBorderColor),
                        ),
                        const Expanded(child: Divider()),
                      ]),
                      SizedBox(height: SizeConfig.screenHeight * 0.02),
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
                      const NoAccountText(),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
