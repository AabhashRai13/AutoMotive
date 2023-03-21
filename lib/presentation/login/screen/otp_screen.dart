import 'dart:developer';

import 'package:auto_motive/presentation/resources/size_config.dart';
import 'package:auto_motive/presentation/resources/strings_manager.dart';
import 'package:auto_motive/presentation/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class OTPScreen extends StatelessWidget {
  final String number;
  const OTPScreen({Key? key, required this.number}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              AppStrings.otpCode,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 80.0),
            ),
            Text(AppStrings.verification.toUpperCase(),
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 40.0),
            Text("${AppStrings.otpScreenText} $number",
                textAlign: TextAlign.center),
            const SizedBox(height: 20.0),
            OTPTextField(
              length: 5,
              width: MediaQuery.of(context).size.width * 0.8,
              fieldWidth: getProportionateScreenWidth(50),
              style: const TextStyle(fontSize: 17),
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldStyle: FieldStyle.underline,
              onCompleted: (pin) {
                log("Completed: $pin");
              },
            ),
            const SizedBox(height: 20.0),
            DefaultButton(
              loading: false,
              text: AppStrings.sendAgain,
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}
