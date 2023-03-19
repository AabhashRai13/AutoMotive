import 'package:auto_motive/domain/entities/onboarding_entities.dart';
import 'package:auto_motive/presentation/resources/color_manager.dart';
import 'package:auto_motive/presentation/resources/duration_constants.dart';
import 'package:auto_motive/presentation/resources/routes_manager.dart';
import 'package:auto_motive/presentation/resources/size_config.dart';
import 'package:auto_motive/presentation/resources/strings_manager.dart';
import 'package:auto_motive/presentation/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'onboarding_screen_content.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  OnboardingScreenState createState() => OnboardingScreenState();
}

class OnboardingScreenState extends State<OnboardingScreen> {
  List<OnboardingScreenModel> introScreenData = [
    const OnboardingScreenModel(
      text: AppStrings.introScreenText1,
    ),
    const OnboardingScreenModel(
      text: AppStrings.introScreenText2,
    ),
    const OnboardingScreenModel(
      text: AppStrings.introScreenText3,
    )
  ];
  var currentPage = 0;

  assignPage(int value) {
    setState(() {
      currentPage = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: PageView.builder(
                  onPageChanged: (value) {
                    assignPage(value);
                  },
                  itemCount: introScreenData.length,
                  itemBuilder: (context, index) => IntroScreenContent(
                    image: introScreenData[index].imgString,
                    text: introScreenData[index].text,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20)),
                  child: Column(
                    children: <Widget>[
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          introScreenData.length,
                          (index) => buildDot(index: index),
                        ),
                      ),
                      const Spacer(flex: 3),
                      DefaultButton(
                        text: AppStrings.continueText,
                        press: () {
                          Navigator.pushReplacementNamed(
                              context, Routes.signIn);
                        },
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index
            ? ColorManager.primary
            : ColorManager.normalBorderColor,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
