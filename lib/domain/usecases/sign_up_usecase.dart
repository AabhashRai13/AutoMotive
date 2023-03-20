import 'package:auto_motive/app/error/failures.dart';
import 'package:auto_motive/app/usecases/usecase.dart';
import 'package:auto_motive/domain/repositories/authentication_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignUpUsecase implements UseCase<AuthResponse, Params> {
  final AuthenticationRepository repository;

  SignUpUsecase(this.repository);

  @override
  Future<Either<Failure, AuthResponse>> call(Params params) async {
    return await repository.signUp(
        email: params.email, password: params.password, phone: params.phone);
  }
}

class Params extends Equatable {
  final String email;
  final String password;
  final String phone;
  const Params(
      {required this.email, required this.password, required this.phone});

  @override
  List<Object> get props => [email, password];
}
