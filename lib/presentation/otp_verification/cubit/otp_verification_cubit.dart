import 'dart:math';

import 'package:auto_motive/app/error/failures.dart';
import 'package:auto_motive/domain/usecases/verify_otp_usecase.dart';
import 'package:auto_motive/presentation/resources/strings_manager.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'otp_verification_state.dart';

class OtpVerificationCubit extends Cubit<OtpVerificationState> {
  OtpVerificationCubit(this.verifyOtpUsecase) : super(OtpVerificationInitial());
  final VerifyOtpUsecase verifyOtpUsecase;

  verifyOtp(String phoneNumber, String otpNumber) async {
    log(1);
    final result = await verifyOtpUsecase.call(
        VerifyOtpNumberParams(phoneNumber: phoneNumber, otpNumber: otpNumber));
    result.fold((l) {
      if (l is ServerFailure) {
        emit(const Error(message: AppStrings.serverFailure));
      } else {
        emit(const Error(message: AppStrings.credentialsFailure));
      }
    }, (r) {
      emit(OtpVerified());
    });
  }
}
