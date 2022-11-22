import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entity/auth_failure.dart';
import '../../../domain/entity/auth_user.dart';

part 'auth_state.freezed.dart';

@immutable
@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = AuthInitial;
  const factory AuthState.loading() = AuthLoading;
  const factory AuthState.authenticated(AuthUser authUser) = Authenticated;
  const factory AuthState.unauthenticated(AuthFailure authFailure) = Unauthenticated;

  const AuthState._();
}
