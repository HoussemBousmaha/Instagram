import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/base/usecase/base_usecase.dart';
import '../../data/model/auth_request.dart';
import '../entity/auth_failure.dart';
import '../entity/auth_user.dart';
import '../repository/auth_repo.dart';

@immutable
class SignInWithEmailAndPasswordUseCase
    extends BaseUseCase<AuthUser, AuthFailure, SignInWithEmailAndPasswordUseCaseParams> {
  final AuthRepo _authRepo;

  const SignInWithEmailAndPasswordUseCase(this._authRepo);

  @override
  Future<Either<AuthFailure, AuthUser>> call(params) async {
    final request = AuthRequest(params.email, params.password);

    return await _authRepo.signInWithEmailAndPassword(request);
  }
}

@immutable
class SignInWithEmailAndPasswordUseCaseParams {
  final String email;
  final String password;

  const SignInWithEmailAndPasswordUseCaseParams(this.email, this.password);
}
