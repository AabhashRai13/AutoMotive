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
      text: "Your Personal Assistant",
      textDesc:
          "Get help with your car insurance, rego renewal, and servicing with Service Journal. Your personal assistant ensures you're never caught off guard",
    ),
    const OnboardingScreenModel(
        text: "Keep track of all your rides",
        textDesc:
            "Whether you have one car or a whole fleet, SJ makes it easy to keep track of all your vehicles. Simply add each car to your profile and setup the assistant."),
    const OnboardingScreenModel(
        text: "Goodbye Paper",
        textDesc:
            "Say goodbye to the stress of keeping a paper logbook! We make it easy to keep track of all your car maintenance needs in one place. ")
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

    return ClipPath(
      clipper: TopCurveClipper(),
      child: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: getProportionateScreenHeight(360),
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
                  textDesc: introScreenData[index].textDesc,
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
                      loading: false,
                      text: AppStrings.continueText,
                      press: () {
                        Navigator.pushReplacementNamed(context, Routes.signIn);
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

class TopCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height);
    path.lineTo(0, size.height - 320);
    path.quadraticBezierTo(
        size.width / 2, size.height - 380, size.width, size.height - 320);
    path.lineTo(size.width, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(TopCurveClipper oldClipper) => false;
}
