import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/base/usecase/base_usecase.dart';
import '../../data/model/auth_request.dart';
import '../entity/auth_failure.dart';
import '../entity/auth_user.dart';
import '../repository/auth_repo.dart';

@immutable
class SignUpWithEmailAndPasswordUseCase
    extends BaseUseCase<AuthUser, AuthFailure, SignUpWithEmailAndPasswordUseCaseParams> {
  final AuthRepo _authRepo;

  const SignUpWithEmailAndPasswordUseCase(this._authRepo);

  @override
  Future<Either<AuthFailure, AuthUser>> call(params) async {
    final request = AuthRequest(params.email, params.password);

    return await _authRepo.signUpWithEmailAndPassword(request);
  }
}

@immutable
class SignUpWithEmailAndPasswordUseCaseParams {
  final String email;
  final String password;

  const SignUpWithEmailAndPasswordUseCaseParams(this.email, this.password);
}
