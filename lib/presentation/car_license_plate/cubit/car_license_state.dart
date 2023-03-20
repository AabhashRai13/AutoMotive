part of 'car_license_cubit.dart';

@immutable
abstract class CarLicenseState {}

class CarLicenseInitial extends CarLicenseState {}

class CarLicenseLoading extends CarLicenseState {}

class CarFound extends CarLicenseState {}

class CarNotFound extends CarLicenseState{}
