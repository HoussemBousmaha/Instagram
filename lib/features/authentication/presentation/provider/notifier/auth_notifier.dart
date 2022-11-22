import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../core/base/usecase/base_usecase.dart';
import '../../../domain/usecase/register_with_email_and_password_usecase.dart.dart';
import '../../../domain/usecase/sign_in_with_email_and_password_usecase.dart';
import '../dependencies/auth_dependencies.dart';
import '../state/auth_state.dart';

part 'auth_notifier.g.dart';

@immutable
abstract class AuthNotifierInterface {
  FutureOr<void> registerWithEmailAndPassword(String email, String password);
  FutureOr<void> signInWithEmailAndPassword(String email, String password);
  FutureOr<void> signInWithGoogle();
  FutureOr<void> signOut();
  FutureOr<AuthState> get currentAuthUser;
}

@Riverpod(keepAlive: true)
class AuthNotifier extends _$AuthNotifier implements AuthNotifierInterface {
  @override
  AuthState build() {
    Future.delayed(
      const Duration(seconds: 1),
      () => currentAuthUser.then((authState) => state = authState),
    );

    return const AuthState.loading();
  }

  @override
  FutureOr<void> registerWithEmailAndPassword(String email, String password) async {
    final registerWithEmailAndPasswordUseCase = ref.read(registerWithEmailAndPasswordUseCaseProvider);

    state = const AuthState.loading();

    final params = RegisterWithEmailAndPasswordUseCaseParams(email, password);

    final result = await registerWithEmailAndPasswordUseCase(params);

    state = result.fold(
      (failure) {
        log('register with email and password failure: $failure');
        return AuthState.unauthenticated(failure);
      },
      (user) {
        log('register with email and password success: $user');
        return AuthState.authenticated(user);
      },
    );
  }

  @override
  FutureOr<void> signInWithEmailAndPassword(String email, String password) async {
    final signInWithEmailAndPasswordUseCase = ref.read(signInWithEmailAndPasswordUseCaseProvider);

    state = const AuthState.loading();

    final params = SignInWithEmailAndPasswordUseCaseParams(email, password);

    final result = await signInWithEmailAndPasswordUseCase(params);

    state = result.fold(
      (failure) {
        log('sign in with email and password failure: $failure');
        return AuthState.unauthenticated(failure);
      },
      (user) {
        log('sign in with email and password success: $user');
        return AuthState.authenticated(user);
      },
    );
  }

  @override
  FutureOr<void> signInWithGoogle() async {
    final signInWithGoogleUseCase = ref.read(signInWithGoogleUseCaseProvider);

    state = const AuthState.loading();

    const params = NoParams();

    final result = await signInWithGoogleUseCase(params);

    state = result.fold(
      (failure) {
        log('sign in with google failure: $failure');
        return AuthState.unauthenticated(failure);
      },
      (user) {
        log('sign in with google success: $user');
        return AuthState.authenticated(user);
      },
    );
  }

  @override
  FutureOr<void> signOut() async {
    final signOutUseCase = ref.read(signOutUseCaseProvider);

    const params = NoParams();

    final result = await signOutUseCase(params);

    state = result.fold(
      (failure) {
        log('register with email and password failure: $failure');
        return AuthState.unauthenticated(failure);
      },
      (_) {
        log('sign out success');
        return const AuthState.initial();
      },
    );
  }

  @override
  Future<AuthState> get currentAuthUser async {
    final getCurrentAuthUserUseCase = ref.read(currentAuthUserUseCaseProvider);

    state = const AuthState.loading();

    const params = NoParams();

    final result = await getCurrentAuthUserUseCase(params);

    state = result.fold(
      (failure) {
        log('get current auth user failure: $failure');
        return AuthState.unauthenticated(failure);
      },
      (user) {
        log('current auth user: $user');
        if (user == null) {
          return const AuthState.initial();
        } else {
          return AuthState.authenticated(user);
        }
      },
    );

    return state;
  }
}
