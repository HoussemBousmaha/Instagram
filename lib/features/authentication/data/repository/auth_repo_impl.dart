import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/constant/failure_constants.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entity/auth_exception.dart';
import '../../domain/entity/auth_failure.dart';
import '../../domain/entity/auth_user.dart';
import '../../domain/repository/auth_repo.dart';
import '../datasource/auth_remote_datasource.dart';
import '../model/auth_request.dart';

@immutable
class AuthRepoImpl implements AuthRepo {
  final NetworkInfo _networkInfo;
  final AuthRemoteDataSource _authRemoteDataSource;

  const AuthRepoImpl(this._authRemoteDataSource, this._networkInfo);
  @override
  Future<Either<AuthFailure, AuthUser>> signUpWithEmailAndPassword(AuthRequest authRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final user = await _authRemoteDataSource.signUpWithEmailAndPassword(authRequest);

        final authUser = AuthUser.fromFirebaseUser(user);
        await _authRemoteDataSource.saveUserInfoToDatabase(authUser);

        return Right(authUser);
      } on AuthException catch (authErr) {
        final message = authErr.message;
        final code = authErr.code;
        return Left(AuthFailure(message, code));
      } catch (_) {
        const message = FailureMessages.unknownFailure;
        const code = FailureCodes.unknownFailure;
        return const Left(AuthFailure(message, code));
      }
    } else {
      const message = FailureMessages.noInternetConnectionFailure;
      const code = FailureCodes.noInternetConnectionFailure;
      return const Left(AuthFailure(message, code));
    }
  }

  @override
  Future<Either<AuthFailure, AuthUser>> signInWithEmailAndPassword(AuthRequest authRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final user = await _authRemoteDataSource.signInWithEmailAndPassword(authRequest);

        final authUser = AuthUser.fromFirebaseUser(user);

        return Right(authUser);
      } on AuthException catch (authErr) {
        final message = authErr.message;
        final code = authErr.code;
        return Left(AuthFailure(message, code));
      } catch (_) {
        const message = FailureMessages.unknownFailure;
        const code = FailureCodes.unknownFailure;
        return const Left(AuthFailure(message, code));
      }
    } else {
      const message = FailureMessages.noInternetConnectionFailure;
      const code = FailureCodes.noInternetConnectionFailure;
      return const Left(AuthFailure(message, code));
    }
  }

  @override
  Future<Either<AuthFailure, AuthUser>> signInWithGoogle() async {
    if (await _networkInfo.isConnected) {
      try {
        final user = await _authRemoteDataSource.signInWithGoogle();

        final authUser = AuthUser.fromFirebaseUser(user);
        await _authRemoteDataSource.saveUserInfoToDatabase(authUser);

        return Right(authUser);
      } on AuthException catch (authErr) {
        final message = authErr.message;
        final code = authErr.code;
        return Left(AuthFailure(message, code));
      } catch (_) {
        const message = FailureMessages.unknownFailure;
        const code = FailureCodes.unknownFailure;
        return const Left(AuthFailure(message, code));
      }
    } else {
      const message = FailureMessages.noInternetConnectionFailure;
      const code = FailureCodes.noInternetConnectionFailure;
      return const Left(AuthFailure(message, code));
    }
  }

  @override
  Future<Either<AuthFailure, AuthUser>> signInWithFacebook() async {
    if (await _networkInfo.isConnected) {
      try {
        final user = await _authRemoteDataSource.signInWithFacebook();

        final authUser = AuthUser.fromFirebaseUser(user);
        await _authRemoteDataSource.saveUserInfoToDatabase(authUser);

        return Right(authUser);
      } on AuthException catch (authErr) {
        final message = authErr.message;
        final code = authErr.code;
        return Left(AuthFailure(message, code));
      } catch (_) {
        const message = FailureMessages.unknownFailure;
        const code = FailureCodes.unknownFailure;
        return const Left(AuthFailure(message, code));
      }
    } else {
      const message = FailureMessages.noInternetConnectionFailure;
      const code = FailureCodes.noInternetConnectionFailure;
      return const Left(AuthFailure(message, code));
    }
  }

  @override
  Future<Either<AuthFailure, void>> signOut() async {
    try {
      return Right(await _authRemoteDataSource.signOut());
    } on AuthException catch (authErr) {
      final message = authErr.message;
      final code = authErr.code;
      return Left(AuthFailure(message, code));
    } catch (_) {
      const message = FailureMessages.unknownFailure;
      const code = FailureCodes.unknownFailure;
      return const Left(AuthFailure(message, code));
    }
  }

  @override
  Future<Either<AuthFailure, AuthUser?>> get currentUser async {
    try {
      final user = await _authRemoteDataSource.currentUser;

      if (user == null) return const Right(null);

      final authUser = AuthUser.fromFirebaseUser(user);
      return Right(authUser);
    } on AuthException catch (authErr) {
      final message = authErr.message;
      final code = authErr.code;
      return Left(AuthFailure(message, code));
    } catch (_) {
      const message = FailureMessages.unknownFailure;
      const code = FailureCodes.unknownFailure;
      return const Left(AuthFailure(message, code));
    }
  }
}
