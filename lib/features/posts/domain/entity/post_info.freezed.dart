// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'post_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PostInfo {
  File? get file => throw _privateConstructorUsedError;
  double? get aspectRatio => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  PostSettings get settings => throw _privateConstructorUsedError;
  FileType get type => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PostInfoCopyWith<PostInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostInfoCopyWith<$Res> {
  factory $PostInfoCopyWith(PostInfo value, $Res Function(PostInfo) then) =
      _$PostInfoCopyWithImpl<$Res, PostInfo>;
  @useResult
  $Res call(
      {File? file,
      double? aspectRatio,
      String? description,
      PostSettings settings,
      FileType type});

  $PostSettingsCopyWith<$Res> get settings;
}

/// @nodoc
class _$PostInfoCopyWithImpl<$Res, $Val extends PostInfo>
    implements $PostInfoCopyWith<$Res> {
  _$PostInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? file = freezed,
    Object? aspectRatio = freezed,
    Object? description = freezed,
    Object? settings = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      file: freezed == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as File?,
      aspectRatio: freezed == aspectRatio
          ? _value.aspectRatio
          : aspectRatio // ignore: cast_nullable_to_non_nullable
              as double?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      settings: null == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as PostSettings,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as FileType,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PostSettingsCopyWith<$Res> get settings {
    return $PostSettingsCopyWith<$Res>(_value.settings, (value) {
      return _then(_value.copyWith(settings: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PostInfoCopyWith<$Res> implements $PostInfoCopyWith<$Res> {
  factory _$$_PostInfoCopyWith(
          _$_PostInfo value, $Res Function(_$_PostInfo) then) =
      __$$_PostInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {File? file,
      double? aspectRatio,
      String? description,
      PostSettings settings,
      FileType type});

  @override
  $PostSettingsCopyWith<$Res> get settings;
}

/// @nodoc
class __$$_PostInfoCopyWithImpl<$Res>
    extends _$PostInfoCopyWithImpl<$Res, _$_PostInfo>
    implements _$$_PostInfoCopyWith<$Res> {
  __$$_PostInfoCopyWithImpl(
      _$_PostInfo _value, $Res Function(_$_PostInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? file = freezed,
    Object? aspectRatio = freezed,
    Object? description = freezed,
    Object? settings = null,
    Object? type = null,
  }) {
    return _then(_$_PostInfo(
      file: freezed == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as File?,
      aspectRatio: freezed == aspectRatio
          ? _value.aspectRatio
          : aspectRatio // ignore: cast_nullable_to_non_nullable
              as double?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      settings: null == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as PostSettings,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as FileType,
    ));
  }
}

/// @nodoc

class _$_PostInfo extends _PostInfo {
  const _$_PostInfo(
      {this.file,
      this.aspectRatio,
      this.description,
      this.settings = const PostSettings(isLikeable: true, isCommentable: true),
      required this.type})
      : super._();

  @override
  final File? file;
  @override
  final double? aspectRatio;
  @override
  final String? description;
  @override
  @JsonKey()
  final PostSettings settings;
  @override
  final FileType type;

  @override
  String toString() {
    return 'PostInfo(file: $file, aspectRatio: $aspectRatio, description: $description, settings: $settings, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PostInfo &&
            (identical(other.file, file) || other.file == file) &&
            (identical(other.aspectRatio, aspectRatio) ||
                other.aspectRatio == aspectRatio) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.settings, settings) ||
                other.settings == settings) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, file, aspectRatio, description, settings, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PostInfoCopyWith<_$_PostInfo> get copyWith =>
      __$$_PostInfoCopyWithImpl<_$_PostInfo>(this, _$identity);
}

abstract class _PostInfo extends PostInfo {
  const factory _PostInfo(
      {final File? file,
      final double? aspectRatio,
      final String? description,
      final PostSettings settings,
      required final FileType type}) = _$_PostInfo;
  const _PostInfo._() : super._();

  @override
  File? get file;
  @override
  double? get aspectRatio;
  @override
  String? get description;
  @override
  PostSettings get settings;
  @override
  FileType get type;
  @override
  @JsonKey(ignore: true)
  _$$_PostInfoCopyWith<_$_PostInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
