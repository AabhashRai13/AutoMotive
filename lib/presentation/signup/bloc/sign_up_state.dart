part of 'sign_up_bloc.dart';

abstract class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object> get props => [];
}

class SignUpInitial extends SignUpState {}

class Loading extends SignUpState {}

class Loaded extends SignUpState {
  final AuthResponse authResponse;

  const Loaded({required this.authResponse});

  @override
  List<Object> get props => [authResponse];
}

class Error extends SignUpState {
  final String message;

  const Error({required this.message});

  @override
  List<Object> get props => [message];
}

