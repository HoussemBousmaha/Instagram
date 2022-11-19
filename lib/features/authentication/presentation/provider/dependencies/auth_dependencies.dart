import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/dependencies/app_dependecies.dart';
import '../../../data/datasource/auth_remote_datasource.dart';
import '../../../data/repository/auth_repo_impl.dart';
import '../../../domain/repository/auth_repo.dart';
import '../../../domain/usecase/current_user_usecase.dart';
import '../../../domain/usecase/sign_in_with_email_and_password_usecase.dart';
import '../../../domain/usecase/sign_in_with_facebook_usecase.dart';
import '../../../domain/usecase/sign_in_with_google_usecase.dart';
import '../../../domain/usecase/sign_out_usecase.dart';
import '../../../domain/usecase/sign_up_with_email_and_password_usecase.dart';

final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
  final firebaseAuth = ref.watch(firebaseAuthProvider);
  final firebaseFirestore = ref.watch(firebaseFirestoreProvider);
  final googleSignIn = ref.watch(googleSignInProvider);
  return AuthRemoteDataSourceImpl(firebaseAuth, firebaseFirestore, googleSignIn);
});

final authRepoProvider = Provider<AuthRepo>((ref) {
  final authRemoteDataSource = ref.watch(authRemoteDataSourceProvider);
  final networkInfo = ref.watch(networkInfoProvider);

  return AuthRepoImpl(authRemoteDataSource, networkInfo);
});

final signInWithEmailAndPasswordUseCaseProvider = Provider<SignInWithEmailAndPasswordUseCase>((ref) {
  final authRepo = ref.watch(authRepoProvider);

  return SignInWithEmailAndPasswordUseCase(authRepo);
});

final signUpWithEmailAndPasswordUseCaseProvider = Provider<SignUpWithEmailAndPasswordUseCase>((ref) {
  final authRepo = ref.watch(authRepoProvider);

  return SignUpWithEmailAndPasswordUseCase(authRepo);
});

final signInWithGoogleUseCaseProvider = Provider<SignInWithGoogleUseCase>((ref) {
  final authRepo = ref.watch(authRepoProvider);

  return SignInWithGoogleUseCase(authRepo);
});

final signInWithFacebookUseCaseProvider = Provider<SignInWithFacebookUseCase>((ref) {
  final authRepo = ref.watch(authRepoProvider);

  return SignInWithFacebookUseCase(authRepo);
});

final signOutUseCaseProvider = Provider<SignOutUseCase>((ref) {
  final authRepo = ref.watch(authRepoProvider);

  return SignOutUseCase(authRepo);
});

final currentUserUseCase = Provider<CurrentUserUseCase>((ref) {
  final authRepo = ref.watch(authRepoProvider);

  return CurrentUserUseCase(authRepo);
});
