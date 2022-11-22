// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_dependecies.dart';

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

String $networkInfoHash() => r'9312f6777e21f55d471d722c8d393397d93118b3';

/// See also [networkInfo].
final networkInfoProvider = AutoDisposeProvider<NetworkInfo>(
  networkInfo,
  name: r'networkInfoProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : $networkInfoHash,
);
typedef NetworkInfoRef = AutoDisposeProviderRef<NetworkInfo>;
String $authHash() => r'352e1b1338f57dc2753fdc9a19d4695c25cc71ee';

/// See also [auth].
final authProvider = AutoDisposeProvider<FirebaseAuth>(
  auth,
  name: r'authProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : $authHash,
);
typedef AuthRef = AutoDisposeProviderRef<FirebaseAuth>;
String $dbHash() => r'4bea9bcf3492f0e4d444e1822fb476e4235e90fd';

/// See also [db].
final dbProvider = AutoDisposeProvider<FirebaseFirestore>(
  db,
  name: r'dbProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : $dbHash,
);
typedef DbRef = AutoDisposeProviderRef<FirebaseFirestore>;
String $storageHash() => r'61a75b8840c1391270bb31ed1518aeed8de5f77e';

/// See also [storage].
final storageProvider = AutoDisposeProvider<FirebaseStorage>(
  storage,
  name: r'storageProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : $storageHash,
);
typedef StorageRef = AutoDisposeProviderRef<FirebaseStorage>;
String $googleAuthHash() => r'b68dc0d8ae7f308f6d588b1f8b5173ce8b0f3364';

/// See also [googleAuth].
final googleAuthProvider = AutoDisposeProvider<GoogleSignIn>(
  googleAuth,
  name: r'googleAuthProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : $googleAuthHash,
);
typedef GoogleAuthRef = AutoDisposeProviderRef<GoogleSignIn>;
String $imagePickerHash() => r'4ade97b98e4e2b1423bb08eb64f280b92f8ac945';

/// See also [imagePicker].
final imagePickerProvider = AutoDisposeProvider<ImagePicker>(
  imagePicker,
  name: r'imagePickerProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : $imagePickerHash,
);
typedef ImagePickerRef = AutoDisposeProviderRef<ImagePicker>;
