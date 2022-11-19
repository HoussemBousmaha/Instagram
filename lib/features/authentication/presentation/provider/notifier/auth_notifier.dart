import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/base/usecase/base_usecase.dart';
import '../../../../../core/constant/enum.dart';
import '../../../../posts/presentation/provider/dependencies/post_providers.dart';
import '../../../domain/entity/auth_failure.dart';
import '../../../domain/entity/auth_user.dart';
import '../../../domain/usecase/sign_in_with_email_and_password_usecase.dart';
import '../../../domain/usecase/sign_up_with_email_and_password_usecase.dart';
import '../dependencies/auth_dependencies.dart';
import '../state/auth_state.dart';

@immutable
abstract class AuthNotifier extends AsyncNotifier<AuthState> {
  void resetState();
  Future<void> signUpWithEmailAndPassword(String email, String password);
  Future<void> signInWithEmailAndPassword(String email, String password);
  Future<void> signOut();
  Future<void> signInWithGoogle();
  Future<void> signInWithFacebook();
  Future<AuthState> get currentAuthUser;
}

typedef AsyncAuthState = AsyncValue<AuthState>;

class AuthNotifierImpl extends AuthNotifier {
  set authState(AuthState state) {
    super.state = AsyncAuthState.data(state);
  }

  @override
  void resetState() {
    authState = AuthState.initial();
  }

  set authFailure(AuthFailure failure) {
    authState = AuthState.failure(failure);
  }

  set authSuccess(AuthUser user) {
    authState = AuthState.success(user);
  }

  set isLoading(bool isLoading) {
    if (isLoading) {
      authState = state.requireValue.copyWith(viewState: ViewState.loading);
    }
  }

  @override
  FutureOr<AuthState> build() async {
    return await currentAuthUser;
  }

  @override
  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    isLoading = true;

    final result = await ref.refresh(signUpWithEmailAndPasswordUseCaseProvider)(
      SignUpWithEmailAndPasswordUseCaseParams(email, password),
    );

    result.fold(
      (failure) {
        debugPrint('sign up with email and password failure: $failure');
        authFailure = failure;
      },
      (authUser) {
        debugPrint('sign up with email and password success');
        authSuccess = authUser;
      },
    );
  }

  @override
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    isLoading = true;

    final result = await ref.read(signInWithEmailAndPasswordUseCaseProvider)(
      SignInWithEmailAndPasswordUseCaseParams(email, password),
    );

    result.fold(
      (failure) {
        debugPrint('sign in with email and password failure: $failure');
        authFailure = failure;
      },
      (authUser) {
        debugPrint('sign in with email and password success');
        authSuccess = authUser;
      },
    );
  }

  @override
  Future<void> signInWithGoogle() async {
    isLoading = true;

    final result = await ref.refresh(signInWithGoogleUseCaseProvider)(const NoParams());

    result.fold(
      (failure) {
        debugPrint('sign in with google failure: $failure');
        authFailure = failure;
      },
      (authUser) {
        debugPrint('sign in with google success');
        authSuccess = authUser;
      },
    );
  }

  @override
  Future<void> signInWithFacebook() async {
    isLoading = true;

    final result = await ref.refresh(signInWithFacebookUseCaseProvider)(const NoParams());

    result.fold(
      (failure) {
        debugPrint('sign in with facebook failure: $failure');
        authFailure = failure;
      },
      (authUser) {
        debugPrint('sign in with facebook success');
        authSuccess = authUser;
      },
    );
  }

  @override
  Future<void> signOut() async {
    isLoading = true;

    await Future.delayed(const Duration(seconds: 1));

    ref.invalidate(postsStreamProvider);

    final result = await ref.refresh(signOutUseCaseProvider)(const NoParams());

    result.fold(
      (failure) {
        debugPrint('sign out failure: $failure');
        authFailure = failure;
      },
      (_) {
        debugPrint('sign out success');
        authState = AuthState.initial();
      },
    );
  }

  @override
  Future<AuthState> get currentAuthUser async {
    await Future.delayed(const Duration(seconds: 1));
    final result = await ref.refresh(currentUserUseCase)(const NoParams());

    return result.fold(
      (failure) {
        debugPrint('check auth status failure: $failure');
        return AuthState.failure(failure);
      },
      (authUser) {
        if (authUser == null) {
          // not signed in
          debugPrint('check auth status success, not signed in');
          return AuthState.initial();
        } else {
          // signed in
          debugPrint('check auth status success, signed in');
          return AuthState.success(authUser);
        }
      },
    );
  }
}
