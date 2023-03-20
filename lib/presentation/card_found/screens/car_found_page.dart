import 'package:auto_motive/presentation/resources/color_manager.dart';
import 'package:auto_motive/presentation/resources/size_config.dart';
import 'package:auto_motive/presentation/resources/strings_manager.dart';
import 'package:auto_motive/presentation/widgets/default_button.dart';
import 'package:flutter/material.dart';

class CarFound extends StatefulWidget {
  const CarFound({
    Key? key,
  }) : super(key: key);

  @override
  CarFoundState createState() => CarFoundState();
}

class CarFoundState extends State<CarFound> {
  int selectedImage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Column(
          children: [
            SizedBox(height: SizeConfig.screenHeight * 0.04),
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
              AppStrings.carFoundPageText,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: getProportionateScreenHeight(30)),
            SizedBox(
              width: double.infinity,
              child: Image.network(
                  "https://www.autotrader.com/wp-content/uploads/2020/02/McLaren-720S.jpg?w=600&h=400&crop=1"),
            ),
            SizedBox(height: getProportionateScreenHeight(30)),
            DefaultButton(
              loading: false,
              text: AppStrings.continueText,
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}
