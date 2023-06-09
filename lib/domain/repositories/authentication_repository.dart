import 'package:auto_motive/app/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, AuthResponse>> signInWithEmail(
      {String email, String password});
  Future<Either<Failure, AuthResponse>> signInWithPhone({String phone});
  Future<Either<Failure, AuthResponse>> verifyOtp(
      {String phone, String? otpNumer});

  Future<Either<Failure, AuthResponse>> signUp(
      {String email, String password, String phone});
}
