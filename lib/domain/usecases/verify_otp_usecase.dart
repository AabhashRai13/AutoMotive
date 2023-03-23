import 'package:auto_motive/app/error/failures.dart';
import 'package:auto_motive/app/usecases/usecase.dart';
import 'package:auto_motive/domain/repositories/authentication_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class VerifyOtpUsecase implements UseCase<AuthResponse, VerifyOtpNumberParams> {
  final AuthenticationRepository repository;

  VerifyOtpUsecase(this.repository);

  @override
  Future<Either<Failure, AuthResponse>> call(
      VerifyOtpNumberParams params) async {
    return await repository.verifyOtp(
        phone: params.phoneNumber, otpNumer: params.otpNumber);
  }
}

class VerifyOtpNumberParams extends Equatable {
  final String phoneNumber;
  final String otpNumber;

  const VerifyOtpNumberParams(
      {required this.phoneNumber, required this.otpNumber});

  @override
  List<Object> get props => [phoneNumber];
}
