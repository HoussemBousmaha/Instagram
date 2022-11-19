import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/base/usecase/base_usecase.dart';
import '../entity/auth_failure.dart';
import '../repository/auth_repo.dart';

@immutable
class SignOutUseCase extends BaseUseCase<void, AuthFailure, NoParams> {
  final AuthRepo _authRepo;

  const SignOutUseCase(this._authRepo);

  @override
  Future<Either<AuthFailure, void>> call(NoParams params) async {
    return await _authRepo.signOut();
  }
}
