part of 'sign_in_bloc.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

class SignIn extends SignInEvent {
  final String email;
  final String password;
  const SignIn({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class SignInWithOtp extends SignInEvent {
  final String phoneNumber;
  const SignInWithOtp({
    required this.phoneNumber,
  });

  @override
  List<Object> get props => [phoneNumber];
}
