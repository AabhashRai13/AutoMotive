part of 'otp_verification_cubit.dart';

abstract class OtpVerificationState extends Equatable {
  const OtpVerificationState();

  @override
  List<Object> get props => [];
}

class OtpVerificationInitial extends OtpVerificationState {}

class OtpVerified extends OtpVerificationState {}

class OtpVerifiicatonFailed extends OtpVerificationState {}
class Error extends OtpVerificationState {
  final String message;

  const Error({required this.message});

  @override
  List<Object> get props => [message];
}
