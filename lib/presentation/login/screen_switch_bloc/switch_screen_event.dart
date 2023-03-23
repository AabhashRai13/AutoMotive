part of 'switch_screen_bloc.dart';

abstract class SwitchScreenEvent extends Equatable {
  const SwitchScreenEvent();

  @override
  List<Object> get props => [];
}


class SignInWithEmailMethod extends SwitchScreenEvent {
  const SignInWithEmailMethod();
}

class SignInWithPhoneMethod extends SwitchScreenEvent {
  const SignInWithPhoneMethod();
}
