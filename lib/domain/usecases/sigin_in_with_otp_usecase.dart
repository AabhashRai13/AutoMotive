import 'package:auto_motive/app/error/failures.dart';
import 'package:auto_motive/app/usecases/usecase.dart';
import 'package:auto_motive/domain/repositories/authentication_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignInWithNumberUsecase implements UseCase<AuthResponse, NumberParams> {
  final AuthenticationRepository repository;

  SignInWithNumberUsecase(this.repository);

  @override
  Future<Either<Failure, AuthResponse>> call(NumberParams params) async {
    return await repository.signInWithPhone(phone: params.phoneNumber);
  }
}

class NumberParams extends Equatable {
  final String phoneNumber;

  const NumberParams({required this.phoneNumber});

  @override
  List<Object> get props => [phoneNumber];
}
