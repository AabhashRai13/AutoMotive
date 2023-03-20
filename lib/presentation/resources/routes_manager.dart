import 'package:auto_motive/presentation/car_license_plate/screens/add_car_license_plate.dart';
import 'package:auto_motive/presentation/card_found/screens/car_found_page.dart';
import 'package:auto_motive/presentation/login/screen/login_screen.dart';
import 'package:auto_motive/presentation/login/screen/otp_screen.dart';
import 'package:auto_motive/presentation/onboarding/screens/onboarding_screen.dart';
import 'package:auto_motive/presentation/signup/screen/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'strings_manager.dart';

class Routes {
  static const String initialScreenRoute = "/";
  static const String signIn = "/signIn";
  static const String signUp = "/signUp";
  static const String otpScreen = "/otpScreen";
  static const String addLicensePlateScreen = "/addLicensePlateScreen";
  static const String carFoundPage = "/carFoundPage";
}

class RouteGenerator {
  static Route<dynamic> getRoute(
    RouteSettings routeSettings,
  ) {
    switch (routeSettings.name) {
      case Routes.initialScreenRoute:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case Routes.signIn:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.signUp:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case Routes.otpScreen:
        final args = routeSettings.arguments as int;

        return MaterialPageRoute(
            builder: (_) => OTPScreen(
                  number: args,
                ));
      case Routes.addLicensePlateScreen:
        return MaterialPageRoute(builder: (_) => AddCarLicensePlate());
      case Routes.carFoundPage:
        return MaterialPageRoute(builder: (_) => const CarFound());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(AppStrings.noRouteFound),
              ),
              body: const Center(child: Text(AppStrings.noRouteFound)),
            ));
  }
}
