import 'package:auto_motive/presentation/resources/color_manager.dart';
import 'package:auto_motive/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';

import '../../resources/size_config.dart';

class IntroScreenContent extends StatelessWidget {
  const IntroScreenContent({
    Key? key,
    this.text,
    this.textDesc,
  }) : super(key: key);
  final String? text, textDesc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          const Spacer(),
          Text(text!,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(
            height: getProportionateScreenHeight(8),
          ),
          Text(textDesc!,
              textAlign: TextAlign.center,
              style: TextStyle(color: ColorManager.normalBorderColor)),
        ],
      ),
    );
  }
}
