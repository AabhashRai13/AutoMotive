
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'switch_screen_event.dart';
part 'switch_screen_state.dart';

class ScreenSwitchBloc extends Bloc<SwitchScreenEvent, SwitchScreenState> {
  ScreenSwitchBloc() : super(SignInInitial()) {
    on<SignInWithEmailMethod>(
      (event, emit) => emit(SignInWithEmail()),
    );
    on<SignInWithPhoneMethod>(
      (event, emit) => emit(SignInWithPhone()),
    );
  }
}
