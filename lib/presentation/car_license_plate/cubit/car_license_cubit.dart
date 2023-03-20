import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'car_license_state.dart';

class CarLicenseCubit extends Cubit<CarLicenseState> {
  CarLicenseCubit() : super(CarLicenseInitial());

  findCar(var carNumbers, BuildContext context) {
    emit(CarLicenseLoading());
    Future.delayed(const Duration(milliseconds: 500), () {
      if (carNumbers == "90011") {
        emit(CarFound());
      } else {
        emit(CarNotFound());
      }
    });
  }
}
