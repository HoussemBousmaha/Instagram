import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/base/usecase/base_usecase.dart';
import '../entity/auth_failure.dart';
import '../entity/auth_user.dart';
import '../repository/auth_repo.dart';

@immutable
class SignInWithGoogleUseCase extends BaseUseCase<AuthUser, AuthFailure, NoParams> {
  final AuthRepo _authRepo;

  const SignInWithGoogleUseCase(this._authRepo);

  @override
  Future<Either<AuthFailure, AuthUser>> call(NoParams params) async {
    return await _authRepo.signInWithGoogle();
  }
}
