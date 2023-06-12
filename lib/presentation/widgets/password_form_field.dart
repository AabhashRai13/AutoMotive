import 'dart:math';

import 'package:auto_motive/presentation/obsecure_cubit/cubit/obscure_cubit_cubit.dart';
import 'package:auto_motive/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app/di.dart';
import '../resources/assets_manager.dart';
import '../resources/size_config.dart';
import 'custom_suffix_icon.dart';

class PasswordFormField extends StatelessWidget {
  final bool obsecure;
  final TextEditingController passwordController;
  PasswordFormField(
      {super.key, required this.passwordController, required this.obsecure});
  final ObscureCubit obscureCubit = sl<ObscureCubit>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ObscureCubit, ObscureCubitState>(
      bloc: obscureCubit,
      builder: (context, state) {
        return TextFormField(
          controller: passwordController,
          obscureText: state.obscure,
          validator: (value) {
            if (value!.isEmpty) {
              return AppStrings.passwordValidationMSg;
            } else if (value.length < 6) {
              return AppStrings.weakPasswordValidationMSg;
            }
            return null;
          },
          decoration: InputDecoration(
            label: SizedBox(
              width: getProportionateScreenWidth(80),
              child:const  Row(
                children:  [
                  Text(AppStrings.password),
                  Text(
                    " *",
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
            ),
            hintText: AppStrings.enterPassword,
            suffixIcon: CustomSurffixIcon(
              isPhoneNumber: false,
              svgIcon: state.obscure
                  ? ImageAssets.eyeIcon
                  : ImageAssets.eyeClosedIcon,
              function: () {
                log(1);
                obscureCubit.obscureText();
              },
            ),
          ),
        );
      },
    );
  }
}
