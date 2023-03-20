part of 'sign_in_bloc.dart';

abstract class SignInState extends Equatable {
  const SignInState();

  @override
  List<Object> get props => [];
}

class SignInInitial extends SignInState {}

class Loading extends SignInState {}

class OtpSent extends SignInState {}

class Loaded extends SignInState {
  final AuthResponse authResponse;

  const Loaded({required this.authResponse});

  @override
  List<Object> get props => [authResponse];
}

class Error extends SignInState {
  final String message;

  const Error({required this.message});

  @override
  List<Object> get props => [message];
}
