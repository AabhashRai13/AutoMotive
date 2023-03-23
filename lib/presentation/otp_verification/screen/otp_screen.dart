import 'dart:developer';

import 'package:auto_motive/presentation/otp_verification/cubit/otp_verification_cubit.dart';
import 'package:auto_motive/presentation/resources/assets_manager.dart';
import 'package:auto_motive/presentation/resources/color_manager.dart';
import 'package:auto_motive/presentation/resources/routes_manager.dart';
import 'package:auto_motive/presentation/resources/size_config.dart';
import 'package:auto_motive/presentation/resources/strings_manager.dart';
import 'package:auto_motive/presentation/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class OTPScreen extends StatefulWidget {
  final String number;
  const OTPScreen({Key? key, required this.number}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  Color buttonColor = ColorManager.normalBorderColor;
  Color textColor = Colors.black;
  bool active = false;
  String? otpNumber;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset(ImageAssets.backArrow),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: BlocConsumer<OtpVerificationCubit, OtpVerificationState>(
        listener: (context, state) {
          if (state is OtpVerified) {
            Navigator.pushReplacementNamed(
                context, Routes.addLicensePlateScreen);
          }
        },
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(AppStrings.verification,
                    style: TextStyle(fontSize: 23)),
                const SizedBox(height: 14.0),
                RichText(
                  text: TextSpan(
                    text: AppStrings.otpScreenText,
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                    children: <TextSpan>[
                      TextSpan(
                          text: '+61 ${widget.number}',
                          style: const TextStyle(color: Colors.black)),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: OTPTextField(
                      length: 6,
                      width: MediaQuery.of(context).size.width,
                      fieldWidth: 60,
                      style: const TextStyle(fontSize: 17),
                      textFieldAlignment: MainAxisAlignment.spaceAround,
                      fieldStyle: FieldStyle.box,
                      onChanged: (value) => {},
                      onCompleted: (pin) {
                        log("Completed: $pin");
                        otpNumber = pin;
                        setState(() {
                          buttonColor = ColorManager.teal;
                          textColor = Colors.white;
                          active = true;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 25.0),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: AppStrings.otpScreenText2,
                      style: const TextStyle(fontSize: 16, color: Colors.grey),
                      children: <TextSpan>[
                        TextSpan(
                            text: " ${AppStrings.sendAgain}",
                            style: TextStyle(color: ColorManager.primary)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15.0),
                Center(
                  child: Text(AppStrings.getViaCall,
                      style: TextStyle(color: ColorManager.primary)),
                ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      getProportionateScreenWidth(8),
                      0,
                      getProportionateScreenWidth(8),
                      getProportionateScreenHeight(30)),
                  child: DefaultButton(
                    textColor: textColor,
                    buttonColor: buttonColor,
                    loading: false,
                    text: AppStrings.verification,
                    press: active
                        ? () {
                            log(otpNumber!);
                            context
                                .read<OtpVerificationCubit>()
                                .verifyOtp(widget.number, otpNumber!);
                          }
                        : () {},
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
