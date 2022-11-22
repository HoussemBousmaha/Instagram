// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'post_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PostSettings _$PostSettingsFromJson(Map<String, dynamic> json) {
  return _PostSettings.fromJson(json);
}

/// @nodoc
mixin _$PostSettings {
  bool get isLikeable => throw _privateConstructorUsedError;
  bool get isCommentable => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostSettingsCopyWith<PostSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostSettingsCopyWith<$Res> {
  factory $PostSettingsCopyWith(
          PostSettings value, $Res Function(PostSettings) then) =
      _$PostSettingsCopyWithImpl<$Res, PostSettings>;
  @useResult
  $Res call({bool isLikeable, bool isCommentable});
}

/// @nodoc
class _$PostSettingsCopyWithImpl<$Res, $Val extends PostSettings>
    implements $PostSettingsCopyWith<$Res> {
  _$PostSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLikeable = null,
    Object? isCommentable = null,
  }) {
    return _then(_value.copyWith(
      isLikeable: null == isLikeable
          ? _value.isLikeable
          : isLikeable // ignore: cast_nullable_to_non_nullable
              as bool,
      isCommentable: null == isCommentable
          ? _value.isCommentable
          : isCommentable // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PostSettingsCopyWith<$Res>
    implements $PostSettingsCopyWith<$Res> {
  factory _$$_PostSettingsCopyWith(
          _$_PostSettings value, $Res Function(_$_PostSettings) then) =
      __$$_PostSettingsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLikeable, bool isCommentable});
}

/// @nodoc
class __$$_PostSettingsCopyWithImpl<$Res>
    extends _$PostSettingsCopyWithImpl<$Res, _$_PostSettings>
    implements _$$_PostSettingsCopyWith<$Res> {
  __$$_PostSettingsCopyWithImpl(
      _$_PostSettings _value, $Res Function(_$_PostSettings) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLikeable = null,
    Object? isCommentable = null,
  }) {
    return _then(_$_PostSettings(
      isLikeable: null == isLikeable
          ? _value.isLikeable
          : isLikeable // ignore: cast_nullable_to_non_nullable
              as bool,
      isCommentable: null == isCommentable
          ? _value.isCommentable
          : isCommentable // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PostSettings extends _PostSettings {
  const _$_PostSettings({required this.isLikeable, required this.isCommentable})
      : super._();

  factory _$_PostSettings.fromJson(Map<String, dynamic> json) =>
      _$$_PostSettingsFromJson(json);

  @override
  final bool isLikeable;
  @override
  final bool isCommentable;

  @override
  String toString() {
    return 'PostSettings(isLikeable: $isLikeable, isCommentable: $isCommentable)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PostSettings &&
            (identical(other.isLikeable, isLikeable) ||
                other.isLikeable == isLikeable) &&
            (identical(other.isCommentable, isCommentable) ||
                other.isCommentable == isCommentable));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isLikeable, isCommentable);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PostSettingsCopyWith<_$_PostSettings> get copyWith =>
      __$$_PostSettingsCopyWithImpl<_$_PostSettings>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PostSettingsToJson(
      this,
    );
  }
}

abstract class _PostSettings extends PostSettings {
  const factory _PostSettings(
      {required final bool isLikeable,
      required final bool isCommentable}) = _$_PostSettings;
  const _PostSettings._() : super._();

  factory _PostSettings.fromJson(Map<String, dynamic> json) =
      _$_PostSettings.fromJson;

  @override
  bool get isLikeable;
  @override
  bool get isCommentable;
  @override
  @JsonKey(ignore: true)
  _$$_PostSettingsCopyWith<_$_PostSettings> get copyWith =>
      throw _privateConstructorUsedError;
}
