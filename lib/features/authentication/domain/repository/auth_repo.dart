import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../data/model/auth_request.dart';
import '../entity/auth_failure.dart';
import '../entity/auth_user.dart';

@immutable
abstract class AuthRepo {
  Future<Either<AuthFailure, AuthUser>> signUpWithEmailAndPassword(AuthRequest authRequest);
  Future<Either<AuthFailure, AuthUser>> signInWithEmailAndPassword(AuthRequest authRequest);
  Future<Either<AuthFailure, AuthUser>> signInWithGoogle();
  Future<Either<AuthFailure, AuthUser>> signInWithFacebook();
  Future<Either<AuthFailure, void>> signOut();
  Future<Either<AuthFailure, AuthUser?>> get currentUser;

  const AuthRepo();
}
