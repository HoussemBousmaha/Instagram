// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_dependencies.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

String $authRemoteDataSourceHash() =>
    r'4e208fcc45b3155180ad047138f237192f2abf91';

/// See also [authRemoteDataSource].
final authRemoteDataSourceProvider = AutoDisposeProvider<AuthRemoteDataSource>(
  authRemoteDataSource,
  name: r'authRemoteDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $authRemoteDataSourceHash,
);
typedef AuthRemoteDataSourceRef = AutoDisposeProviderRef<AuthRemoteDataSource>;
String $authRepoHash() => r'b7e45cc53b1176fe9682439292910b84f2ced8e5';

/// See also [authRepo].
final authRepoProvider = AutoDisposeProvider<AuthRepo>(
  authRepo,
  name: r'authRepoProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : $authRepoHash,
);
typedef AuthRepoRef = AutoDisposeProviderRef<AuthRepo>;
String $signInWithEmailAndPasswordUseCaseHash() =>
    r'e25b75fc18758f46906396b3ae05195064af6a22';

/// See also [signInWithEmailAndPasswordUseCase].
final signInWithEmailAndPasswordUseCaseProvider =
    AutoDisposeProvider<SignInWithEmailAndPasswordUseCase>(
  signInWithEmailAndPasswordUseCase,
  name: r'signInWithEmailAndPasswordUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $signInWithEmailAndPasswordUseCaseHash,
);
typedef SignInWithEmailAndPasswordUseCaseRef
    = AutoDisposeProviderRef<SignInWithEmailAndPasswordUseCase>;
String $registerWithEmailAndPasswordUseCaseHash() =>
    r'99da83089f2e131c365cffaf00d0b585c8e25a31';

/// See also [registerWithEmailAndPasswordUseCase].
final registerWithEmailAndPasswordUseCaseProvider =
    AutoDisposeProvider<RegisterWithEmailAndPasswordUseCase>(
  registerWithEmailAndPasswordUseCase,
  name: r'registerWithEmailAndPasswordUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $registerWithEmailAndPasswordUseCaseHash,
);
typedef RegisterWithEmailAndPasswordUseCaseRef
    = AutoDisposeProviderRef<RegisterWithEmailAndPasswordUseCase>;
String $signInWithGoogleUseCaseHash() =>
    r'99b275b95eb93e0d67f5091b33a107aa37a679d7';

/// See also [signInWithGoogleUseCase].
final signInWithGoogleUseCaseProvider =
    AutoDisposeProvider<SignInWithGoogleUseCase>(
  signInWithGoogleUseCase,
  name: r'signInWithGoogleUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $signInWithGoogleUseCaseHash,
);
typedef SignInWithGoogleUseCaseRef
    = AutoDisposeProviderRef<SignInWithGoogleUseCase>;
String $signOutUseCaseHash() => r'4da512f14ac919fa59de698a661f2d4a2e7d6ee4';

/// See also [signOutUseCase].
final signOutUseCaseProvider = AutoDisposeProvider<SignOutUseCase>(
  signOutUseCase,
  name: r'signOutUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $signOutUseCaseHash,
);
typedef SignOutUseCaseRef = AutoDisposeProviderRef<SignOutUseCase>;
String $currentAuthUserUseCaseHash() =>
    r'cccd06988124026576b23a32299a219b3f02c97b';

/// See also [currentAuthUserUseCase].
final currentAuthUserUseCaseProvider =
    AutoDisposeProvider<CurrentAuthUserUseCase>(
  currentAuthUserUseCase,
  name: r'currentAuthUserUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $currentAuthUserUseCaseHash,
);
typedef CurrentAuthUserUseCaseRef
    = AutoDisposeProviderRef<CurrentAuthUserUseCase>;
