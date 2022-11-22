import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/base/usecase/base_usecase.dart';
import '../../data/model/auth_request.dart';
import '../entity/auth_failure.dart';
import '../entity/auth_user.dart';
import '../repository/auth_repo.dart';

@immutable
class RegisterWithEmailAndPasswordUseCase
    extends BaseUseCase<AuthUser, AuthFailure, RegisterWithEmailAndPasswordUseCaseParams> {
  final AuthRepo _authRepo;

  const RegisterWithEmailAndPasswordUseCase(this._authRepo);

  @override
  Future<Either<AuthFailure, AuthUser>> call(params) async {
    final request = AuthRequest(email: params.email, password: params.password);

    return await _authRepo.signUpWithEmailAndPassword(request);
  }
}

@immutable
class RegisterWithEmailAndPasswordUseCaseParams {
  final String email;
  final String password;

  const RegisterWithEmailAndPasswordUseCaseParams(this.email, this.password);
}
