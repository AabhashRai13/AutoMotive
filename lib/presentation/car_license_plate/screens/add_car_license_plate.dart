import 'package:auto_motive/presentation/car_license_plate/cubit/car_license_cubit.dart';
import 'package:auto_motive/presentation/resources/color_manager.dart';
import 'package:auto_motive/presentation/resources/routes_manager.dart';
import 'package:auto_motive/presentation/resources/size_config.dart';
import 'package:auto_motive/presentation/resources/strings_manager.dart';
import 'package:auto_motive/presentation/widgets/default_button.dart';
import 'package:auto_motive/presentation/widgets/input_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class AddCarLicensePlate extends StatelessWidget {
  AddCarLicensePlate({super.key});
  final TextEditingController licensePlateController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.emptyString),
      ),
      body: SafeArea(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Form(
              key: formKey,
              child: BlocConsumer<CarLicenseCubit, CarLicenseState>(
                listener: (context, state) {
                  if (state is CarNotFound) {
                    loading = false;
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text(AppStrings.carNotFound)),
                    );
                  } else if (state is CarFound) {
                    loading = false;
                    Navigator.pushNamed(context, Routes.carFoundPage);
                  } else if (state is CarLicenseLoading) {
                    loading = true;
                  }
                },
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: SizeConfig.screenHeight * 0.1),
                      Text(
                        AppStrings.automotiveText,
                        style: TextStyle(
                          color: ColorManager.primary,
                          fontSize: getProportionateScreenWidth(28),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: getProportionateScreenHeight(30)),
                      const Text(
                        AppStrings.addLicensePlateText,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: getProportionateScreenHeight(30)),
                      InputFields(
                        inputController: licensePlateController,
                        isRequired: true,
                        validationMsg:
                            AppStrings.addLicensePlateValidationError,
                        labelText: AppStrings.licensePlateLabe,
                        hintText: AppStrings.addLicensePlateText,
                      ),
                      SizedBox(height: getProportionateScreenHeight(60)),
                      DefaultButton(
                        loading: loading,
                        text: AppStrings.continueText,
                        press: loading
                            ? () {}
                            : () {
                                if (formKey.currentState!.validate()) {
                                  context.read<CarLicenseCubit>().findCar(
                                      licensePlateController.text, context);
                                }
                              },
                      ),
                    ],
                  );
                },
              )),
        ),
      ),
    );
  }
}
