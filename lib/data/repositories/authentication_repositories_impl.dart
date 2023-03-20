import 'dart:developer';

import 'package:auto_motive/app/error/exceptions.dart';
import 'package:auto_motive/app/error/failures.dart';
import 'package:auto_motive/app/network/network_info.dart';
import 'package:auto_motive/data/network/superbase/superbase_manager.dart';
import 'package:auto_motive/domain/repositories/authentication_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthenticaionRepositoryImpl implements AuthenticationRepository {
  final NetworkInfo networkInfo;
  final SuparbaseManager suparbaseManager;
  AuthenticaionRepositoryImpl(
    this.networkInfo,
    this.suparbaseManager,
  );

  @override
  Future<Either<Failure, AuthResponse>> signInWithEmail(
      {String? email, String? password}) async {
    bool connection = await networkInfo.isConnected();
    if (connection) {
      try {
        final result =
            await suparbaseManager.signInUser(email: email, password: password);

        if (result != null) {
          return Right(result);
        } else {
          return Left(CredentialsFailure());
        }
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(CredentialsFailure());
    }
  }

  @override
  Future<Either<Failure, AuthResponse>> signUp(
      {String? email, String? password, String? phone}) async {
    bool connection = await networkInfo.isConnected();
    if (connection) {
      try {
        final result = await suparbaseManager.signUpUser(
            email: email, password: password, phone: phone!);
        return Right(result);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(CredentialsFailure());
    }
  }

  @override
  Future<Either<Failure, AuthResponse>> signInWithPhone({String? phone}) async {
    bool connection = await networkInfo.isConnected();
    if (connection) {
      try {
        await suparbaseManager.signInWithOTP(number: phone);
        return Right(AuthResponse());
      } catch (e) {
        log("$e");
        return Left(CredentialsFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
