// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_dependencies.dart';

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

String $postRemoteDataSourceHash() =>
    r'47dfc0e2608c8869894408da9cda1e442c6d24d8';

/// See also [postRemoteDataSource].
final postRemoteDataSourceProvider = AutoDisposeProvider<PostRemoteDataSource>(
  postRemoteDataSource,
  name: r'postRemoteDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $postRemoteDataSourceHash,
);
typedef PostRemoteDataSourceRef = AutoDisposeProviderRef<PostRemoteDataSource>;
String $postRepoHash() => r'5aaa73aaabaead77dfe3045135ee1386bed4c02e';

/// See also [postRepo].
final postRepoProvider = AutoDisposeProvider<PostRepo>(
  postRepo,
  name: r'postRepoProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : $postRepoHash,
);
typedef PostRepoRef = AutoDisposeProviderRef<PostRepo>;
String $createPostUseCaseHash() => r'e983688fb823d652a94305dbb2c20e0c99c6e9b0';

/// See also [createPostUseCase].
final createPostUseCaseProvider = AutoDisposeProvider<CreatePostUseCase>(
  createPostUseCase,
  name: r'createPostUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $createPostUseCaseHash,
);
typedef CreatePostUseCaseRef = AutoDisposeProviderRef<CreatePostUseCase>;
String $deletePostUseCaseHash() => r'e06c5c40f69c0085900821e302e2eb7afd929aa1';

/// See also [deletePostUseCase].
final deletePostUseCaseProvider = AutoDisposeProvider<DeletePostUseCase>(
  deletePostUseCase,
  name: r'deletePostUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $deletePostUseCaseHash,
);
typedef DeletePostUseCaseRef = AutoDisposeProviderRef<DeletePostUseCase>;
