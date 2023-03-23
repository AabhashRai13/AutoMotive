import 'package:auto_motive/app/params/alert_dialog_params.dart';
import 'package:auto_motive/presentation/resources/assets_manager.dart';
import 'package:auto_motive/presentation/resources/color_manager.dart';
import 'package:auto_motive/presentation/resources/size_config.dart';
import 'package:auto_motive/presentation/resources/strings_manager.dart';
import 'package:auto_motive/presentation/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Future<void> customDialog(
    BuildContext context, AlertDialogParams params) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0))),
        title: Text(
          params.dialogHeading,
          textAlign: TextAlign.center,
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              _chatBox(context),
              Container(
                width: getProportionateScreenWidth(10),
                height: getProportionateScreenHeight(40),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.red[500]!,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: Text(
                  "${params.dialogMsg} NSW",
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DefaultButton(
              height: getProportionateScreenHeight(40),
              loading: false,
              textColor: Colors.white,
              buttonColor: ColorManager.teal,
              press: () {
                Navigator.of(context).pop();
              },
              text: AppStrings.searchAgain,
            ),
          ),
        ],
      );
    },
  );
}

Widget _chatBox(BuildContext context) {
  return SizedBox(
    height: getProportionateScreenHeight(75),
    width: double.infinity,
    child: Row(
      children: [
        SizedBox(
          height: getProportionateScreenHeight(60),
          width: getProportionateScreenWidth(30),
          child: const Image(
            image: AssetImage(
              ImageAssets.mascot,
            ),
            fit: BoxFit.cover,
          ),
        ),
        SvgPicture.asset(
          ImageAssets.notFound,
          height: getProportionateScreenHeight(60),
        ),
      ],
    ),
  );
}
