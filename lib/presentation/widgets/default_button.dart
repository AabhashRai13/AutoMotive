import 'package:auto_motive/presentation/resources/color_manager.dart';
import 'package:auto_motive/presentation/resources/size_config.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton(
      {Key? key,
      this.text,
      this.press,
      required this.loading,
      this.buttonColor,
      this.height,
      this.textColor})
      : super(key: key);
  final String? text;
  final Function? press;
  final bool loading;
  final Color? buttonColor;
  final Color? textColor;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height ?? getProportionateScreenHeight(56),
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          backgroundColor: buttonColor ?? ColorManager.primary,
        ),
        onPressed: press as void Function()?,
        child: loading
            ? const Center(
                child: CircularProgressIndicator(color: Colors.white),
              )
            : Text(
                text!,
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(18),
                  color: textColor ?? Colors.white,
                ),
              ),
      ),
    );
  }
}
