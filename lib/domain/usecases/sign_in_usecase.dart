import 'package:auto_motive/app/error/failures.dart';
import 'package:auto_motive/app/usecases/usecase.dart';
import 'package:auto_motive/domain/repositories/authentication_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignInUsecase implements UseCase<AuthResponse, Params> {
  final AuthenticationRepository repository;

  SignInUsecase(this.repository);

  @override
  Future<Either<Failure, AuthResponse>> call(Params params) async {
    return await repository.signInWithEmail(
        email: params.email, password: params.password);
  }
}

class Params extends Equatable {
  final String email;
  final String password;

  const Params({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}