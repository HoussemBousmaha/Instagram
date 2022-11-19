import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constant/enum.dart';
import '../../../domain/entity/auth_failure.dart';
import '../../../domain/entity/auth_user.dart';

@immutable
class AuthState extends Equatable {
  final AuthUser? user;
  final AuthFailure? failure;
  final ViewState viewState;

  const AuthState({this.user, this.failure, required this.viewState});

  factory AuthState.initial() => const AuthState(viewState: ViewState.initial);

  factory AuthState.failure(AuthFailure failure) => AuthState(failure: failure, viewState: ViewState.failure);

  factory AuthState.success(AuthUser user) => AuthState(user: user, viewState: ViewState.success);

  AuthState copyWith({AuthUser? user, AuthFailure? failure, ViewState? viewState}) {
    return AuthState(
      user: user ?? this.user,
      failure: failure ?? this.failure,
      viewState: viewState ?? this.viewState,
    );
  }

  @override
  List<Object?> get props => [user, failure, viewState];

  @override
  bool get stringify => true;
}
