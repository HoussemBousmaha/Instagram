import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../core/dependencies/app_dependecies.dart';
import '../../../data/datasource/auth_remote_datasource.dart';
import '../../../data/repository/auth_repo_impl.dart';
import '../../../domain/repository/auth_repo.dart';
import '../../../domain/usecase/current_user_usecase.dart';
import '../../../domain/usecase/register_with_email_and_password_usecase.dart.dart';
import '../../../domain/usecase/sign_in_with_email_and_password_usecase.dart';
import '../../../domain/usecase/sign_in_with_google_usecase.dart';
import '../../../domain/usecase/sign_out_usecase.dart';

part 'auth_dependencies.g.dart';

@riverpod
AuthRemoteDataSource authRemoteDataSource(AuthRemoteDataSourceRef ref) {
  final firebaseAuth = ref.watch(authProvider);
  final firebaseFirestore = ref.watch(dbProvider);
  final googleSignIn = ref.watch(googleAuthProvider);

  return AuthRemoteDataSourceImpl(firebaseAuth, firebaseFirestore, googleSignIn);
}

@riverpod
AuthRepo authRepo(AuthRepoRef ref) {
  final authRemoteDataSource = ref.watch(authRemoteDataSourceProvider);
  final networkInfo = ref.watch(networkInfoProvider);
  return AuthRepoImpl(authRemoteDataSource, networkInfo);
}

@riverpod
SignInWithEmailAndPasswordUseCase signInWithEmailAndPasswordUseCase(SignInWithEmailAndPasswordUseCaseRef ref) {
  final authRepo = ref.watch(authRepoProvider);
  return SignInWithEmailAndPasswordUseCase(authRepo);
}

@riverpod
RegisterWithEmailAndPasswordUseCase registerWithEmailAndPasswordUseCase(RegisterWithEmailAndPasswordUseCaseRef ref) {
  final authRepo = ref.watch(authRepoProvider);
  return RegisterWithEmailAndPasswordUseCase(authRepo);
}

@riverpod
SignInWithGoogleUseCase signInWithGoogleUseCase(SignInWithGoogleUseCaseRef ref) {
  final authRepo = ref.watch(authRepoProvider);
  return SignInWithGoogleUseCase(authRepo);
}

@riverpod
SignOutUseCase signOutUseCase(SignOutUseCaseRef ref) {
  final authRepo = ref.watch(authRepoProvider);
  return SignOutUseCase(authRepo);
}

@riverpod
CurrentAuthUserUseCase currentAuthUserUseCase(CurrentAuthUserUseCaseRef ref) {
  final authRepo = ref.watch(authRepoProvider);
  return CurrentAuthUserUseCase(authRepo);
}
