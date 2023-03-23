import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../resources/size_config.dart';

class CustomSurffixIcon extends StatelessWidget {
  final double? leftPadding;
  final double? rightPadding;
  final bool? isPhoneNumber;
  final Function? function;
  const CustomSurffixIcon(
      {Key? key,
      required this.svgIcon,
      this.leftPadding,
      this.rightPadding,
      this.isPhoneNumber,
      this.function})
      : super(key: key);

  final String svgIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        leftPadding != null ? getProportionateScreenWidth(leftPadding!) : 0,
        getProportionateScreenWidth(20),
        rightPadding != null
            ? getProportionateScreenWidth(rightPadding!)
            : getProportionateScreenWidth(20),
        getProportionateScreenWidth(20),
      ),
      child: isPhoneNumber!
          ? SizedBox(
              width: getProportionateScreenWidth(52),
              child: Row(
                children: [
                  SvgPicture.asset(
                    svgIcon,
                    height: getProportionateScreenWidth(18),
                  ),
                  const Text(" +61 |"),
                ],
              ),
            )
          : GestureDetector(
              onTap: function as void Function()?,
              child: SvgPicture.asset(
                svgIcon,
                height: getProportionateScreenWidth(18),
              ),
            ),
    );
  }
}
