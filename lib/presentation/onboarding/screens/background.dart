import 'package:auto_motive/presentation/onboarding/screens/onboarding_screen.dart';
import 'package:auto_motive/presentation/resources/assets_manager.dart';
import 'package:auto_motive/presentation/resources/size_config.dart';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BackGround extends StatelessWidget {
  const BackGround({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        alignment: Alignment.center,
        children: [
          _backGround(context),
          _backGround2(context),
          Positioned(top: 100, child: _logo(context)),
          const Positioned(bottom: 0, child: OnboardingScreen()),
        ],
      ),
    );
  }

  Widget appBar(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: getProportionateScreenHeight(60),
      child: IconButton(
        icon: Image.asset(
          ImageAssets.backArrow,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }

  Widget _backGround(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: const Image(
        image: AssetImage(
          ImageAssets.carBackground,
        ),
        fit: BoxFit.cover,
      ),
    );
  }


  Widget _backGround2(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: const Image(
        image: AssetImage(
          ImageAssets.splashBg,
        ),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _logo(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width * 0.8,
      child: const Image(
        image: AssetImage(
          ImageAssets.logo,
        ),
        fit: BoxFit.contain,
      ),
    );
  }
}


