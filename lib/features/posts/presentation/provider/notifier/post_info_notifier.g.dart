// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_info_notifier.dart';

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

String $PostInfoNotifierHash() => r'5adb826f104a9fad3da864a8662f1a57aa5e5ad0';

/// See also [PostInfoNotifier].
class PostInfoNotifierProvider
    extends AutoDisposeNotifierProviderImpl<PostInfoNotifier, PostInfo> {
  PostInfoNotifierProvider(
    this.type,
  ) : super(
          () => PostInfoNotifier()..type = type,
          from: postInfoNotifierProvider,
          name: r'postInfoNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : $PostInfoNotifierHash,
        );

  final FileType type;

  @override
  bool operator ==(Object other) {
    return other is PostInfoNotifierProvider && other.type == type;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, type.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  PostInfo runNotifierBuild(
    covariant _$PostInfoNotifier notifier,
  ) {
    return notifier.build(
      type,
    );
  }
}

typedef PostInfoNotifierRef = AutoDisposeNotifierProviderRef<PostInfo>;

/// See also [PostInfoNotifier].
final postInfoNotifierProvider = PostInfoNotifierFamily();

class PostInfoNotifierFamily extends Family<PostInfo> {
  PostInfoNotifierFamily();

  PostInfoNotifierProvider call(
    FileType type,
  ) {
    return PostInfoNotifierProvider(
      type,
    );
  }

  @override
  AutoDisposeNotifierProviderImpl<PostInfoNotifier, PostInfo>
      getProviderOverride(
    covariant PostInfoNotifierProvider provider,
  ) {
    return call(
      provider.type,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'postInfoNotifierProvider';
}

abstract class _$PostInfoNotifier
    extends BuildlessAutoDisposeNotifier<PostInfo> {
  late final FileType type;

  PostInfo build(
    FileType type,
  );
}
