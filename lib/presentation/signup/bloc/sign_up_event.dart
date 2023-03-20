part of 'sign_up_bloc.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class SignUp extends SignUpEvent {
  final String email;
  final String password;
  const SignUp(
      {required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}
