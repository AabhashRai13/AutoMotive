import 'package:auto_motive/app/di.dart';
import 'package:auto_motive/app/params/alert_dialog_params.dart';
import 'package:auto_motive/presentation/car_license_plate/cubit/car_license_cubit.dart';
import 'package:auto_motive/presentation/resources/assets_manager.dart';
import 'package:auto_motive/presentation/resources/routes_manager.dart';
import 'package:auto_motive/presentation/resources/size_config.dart';
import 'package:auto_motive/presentation/resources/strings_manager.dart';
import 'package:auto_motive/presentation/widgets/alert_dialog.dart';
import 'package:auto_motive/presentation/widgets/default_button.dart';
import 'package:auto_motive/presentation/widgets/input_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class AddCarLicensePlate extends StatelessWidget {
  AddCarLicensePlate({super.key});
  final TextEditingController licensePlateController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool loading = false;
  CarLicenseCubit carLicenseCubit = sl<CarLicenseCubit>();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(top: 50, child: appBar(context)),
          _backGround(context),
          _backGround2(context),
          Positioned(top: 100, child: _logo(context)),
          Positioned(bottom: 0, child: enterLicensePlateNumber(context)),
          Positioned(
            top: getProportionateScreenHeight(60),
            right: getProportionateScreenWidth(160),
            child: appBar(context),
          ),
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

  Widget enterLicensePlateNumber(BuildContext context) {
    return ClipPath(
      clipper: TopCurveClipper(),
      child: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: 450,
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              getProportionateScreenWidth(20),
              getProportionateScreenHeight(20),
              getProportionateScreenWidth(20),
              getProportionateScreenHeight(20)),
          child: Form(
              key: formKey,
              child: BlocConsumer<CarLicenseCubit, CarLicenseState>(
                bloc: carLicenseCubit,
                listener: (context, state) {
                  if (state is CarNotFound) {
                    loading = false;
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //   const SnackBar(content: Text(AppStrings.carNotFound)),
                    // );
                    customDialog(
                        context,
                        AlertDialogParams(
                            dialogMsg:
                                licensePlateController.text.toUpperCase(),
                            dialogHeading: AppStrings.carNotFoundTitle,
                            buttonText: AppStrings.searchAgain));
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
                      SizedBox(height: getProportionateScreenHeight(30)),
                      _chatBox(context),
                      SizedBox(height: getProportionateScreenHeight(10)),
                      InputFields(
                        icon: ImageAssets.picker,
                        prefixIcon: ImageAssets.group,
                        inputController: licensePlateController,
                        isRequired: true,
                        validationMsg:
                            AppStrings.addLicensePlateValidationError,
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
                                  carLicenseCubit.findCar(
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

  Widget _chatBox(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenHeight(90),
      width: double.infinity,
      child: Row(
        children: [
          SizedBox(
            height: getProportionateScreenHeight(80),
            width: getProportionateScreenWidth(60),
            child: const Image(
              image: AssetImage(
                ImageAssets.mascot,
              ),
              fit: BoxFit.cover,
            ),
          ),
          SvgPicture.asset(
            ImageAssets.messageBox,
            height: getProportionateScreenHeight(80),
          ),
        ],
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

class TopCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height);
    path.lineTo(0, size.height - 400);
    path.quadraticBezierTo(
        size.width / 2, size.height - 500, size.width, size.height - 400);
    path.lineTo(size.width, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(TopCurveClipper oldClipper) => false;
}
