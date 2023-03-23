part of 'switch_screen_bloc.dart';

abstract class SwitchScreenState extends Equatable {
  const SwitchScreenState();

  @override
  List<Object> get props => [];
}

class SignInInitial extends SwitchScreenState {}

class Loading extends SwitchScreenState {}

class SignInWithEmail extends SwitchScreenState {}

class SignInWithPhone extends SwitchScreenState {}

class OtpSent extends SwitchScreenState {}

class Loaded extends SwitchScreenState {
  final AuthResponse authResponse;

  const Loaded({required this.authResponse});

  @override
  List<Object> get props => [authResponse];
}

class Error extends SwitchScreenState {
  final String message;

  const Error({required this.message});

  @override
  List<Object> get props => [message];
}
