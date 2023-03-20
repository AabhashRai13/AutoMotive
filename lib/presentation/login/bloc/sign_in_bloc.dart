import 'package:auto_motive/app/error/failures.dart';
import 'package:auto_motive/domain/usecases/sigin_in_with_otp_usecase.dart';
import 'package:auto_motive/domain/usecases/sign_in_usecase.dart';
import 'package:auto_motive/presentation/resources/strings_manager.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignInUsecase signInUsecase;
  final SignInWithNumberUsecase signInWithNumberUsecase;
  SignInBloc(this.signInUsecase, this.signInWithNumberUsecase)
      : super(SignInInitial()) {
    on<SignIn>(signIn);
    on<SignInWithOtp>(signInWithNumber);
  }
  signIn(SignIn event, Emitter<SignInState> emit) async {
    emit(Loading());
    final result = await signInUsecase
        .call(Params(email: event.email, password: event.password));

    result.fold((l) {
      if (l is ServerFailure) {
        emit(const Error(message: AppStrings.serverFailure));
      } else {
        emit(const Error(message: AppStrings.credentialsFailure));
      }
    }, (r) {
      emit(Loaded(authResponse: r));
    });
  }

  signInWithNumber(SignInWithOtp event, Emitter<SignInState> emit) async {
    final result = await signInWithNumberUsecase
        .call(NumberParams(phoneNumber: event.phoneNumber));
    result.fold((l) {
      if (l is ServerFailure) {
        emit(const Error(message: AppStrings.serverFailure));
      } else {
        emit(const Error(message: AppStrings.credentialsFailure));
      }
    }, (r) {
      emit(OtpSent());
    });
  }
}
