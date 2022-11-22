// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'create_post_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CreatePostRequest {
  File get file => throw _privateConstructorUsedError;
  Uint8List get thumbnail => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  FileType get type => throw _privateConstructorUsedError;
  double get aspectRatio => throw _privateConstructorUsedError;
  PostSettings get settings => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreatePostRequestCopyWith<CreatePostRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreatePostRequestCopyWith<$Res> {
  factory $CreatePostRequestCopyWith(
          CreatePostRequest value, $Res Function(CreatePostRequest) then) =
      _$CreatePostRequestCopyWithImpl<$Res, CreatePostRequest>;
  @useResult
  $Res call(
      {File file,
      Uint8List thumbnail,
      String description,
      FileType type,
      double aspectRatio,
      PostSettings settings});

  $PostSettingsCopyWith<$Res> get settings;
}

/// @nodoc
class _$CreatePostRequestCopyWithImpl<$Res, $Val extends CreatePostRequest>
    implements $CreatePostRequestCopyWith<$Res> {
  _$CreatePostRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? file = null,
    Object? thumbnail = null,
    Object? description = null,
    Object? type = null,
    Object? aspectRatio = null,
    Object? settings = null,
  }) {
    return _then(_value.copyWith(
      file: null == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as File,
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as Uint8List,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as FileType,
      aspectRatio: null == aspectRatio
          ? _value.aspectRatio
          : aspectRatio // ignore: cast_nullable_to_non_nullable
              as double,
      settings: null == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as PostSettings,
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
abstract class _$$_CreatePostRequestCopyWith<$Res>
    implements $CreatePostRequestCopyWith<$Res> {
  factory _$$_CreatePostRequestCopyWith(_$_CreatePostRequest value,
          $Res Function(_$_CreatePostRequest) then) =
      __$$_CreatePostRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {File file,
      Uint8List thumbnail,
      String description,
      FileType type,
      double aspectRatio,
      PostSettings settings});

  @override
  $PostSettingsCopyWith<$Res> get settings;
}

/// @nodoc
class __$$_CreatePostRequestCopyWithImpl<$Res>
    extends _$CreatePostRequestCopyWithImpl<$Res, _$_CreatePostRequest>
    implements _$$_CreatePostRequestCopyWith<$Res> {
  __$$_CreatePostRequestCopyWithImpl(
      _$_CreatePostRequest _value, $Res Function(_$_CreatePostRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? file = null,
    Object? thumbnail = null,
    Object? description = null,
    Object? type = null,
    Object? aspectRatio = null,
    Object? settings = null,
  }) {
    return _then(_$_CreatePostRequest(
      file: null == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as File,
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as Uint8List,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as FileType,
      aspectRatio: null == aspectRatio
          ? _value.aspectRatio
          : aspectRatio // ignore: cast_nullable_to_non_nullable
              as double,
      settings: null == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as PostSettings,
    ));
  }
}

/// @nodoc

class _$_CreatePostRequest
    with DiagnosticableTreeMixin
    implements _CreatePostRequest {
  const _$_CreatePostRequest(
      {required this.file,
      required this.thumbnail,
      required this.description,
      required this.type,
      required this.aspectRatio,
      required this.settings});

  @override
  final File file;
  @override
  final Uint8List thumbnail;
  @override
  final String description;
  @override
  final FileType type;
  @override
  final double aspectRatio;
  @override
  final PostSettings settings;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CreatePostRequest(file: $file, thumbnail: $thumbnail, description: $description, type: $type, aspectRatio: $aspectRatio, settings: $settings)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CreatePostRequest'))
      ..add(DiagnosticsProperty('file', file))
      ..add(DiagnosticsProperty('thumbnail', thumbnail))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('aspectRatio', aspectRatio))
      ..add(DiagnosticsProperty('settings', settings));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreatePostRequest &&
            (identical(other.file, file) || other.file == file) &&
            const DeepCollectionEquality().equals(other.thumbnail, thumbnail) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.aspectRatio, aspectRatio) ||
                other.aspectRatio == aspectRatio) &&
            (identical(other.settings, settings) ||
                other.settings == settings));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      file,
      const DeepCollectionEquality().hash(thumbnail),
      description,
      type,
      aspectRatio,
      settings);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreatePostRequestCopyWith<_$_CreatePostRequest> get copyWith =>
      __$$_CreatePostRequestCopyWithImpl<_$_CreatePostRequest>(
          this, _$identity);
}

abstract class _CreatePostRequest implements CreatePostRequest {
  const factory _CreatePostRequest(
      {required final File file,
      required final Uint8List thumbnail,
      required final String description,
      required final FileType type,
      required final double aspectRatio,
      required final PostSettings settings}) = _$_CreatePostRequest;

  @override
  File get file;
  @override
  Uint8List get thumbnail;
  @override
  String get description;
  @override
  FileType get type;
  @override
  double get aspectRatio;
  @override
  PostSettings get settings;
  @override
  @JsonKey(ignore: true)
  _$$_CreatePostRequestCopyWith<_$_CreatePostRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
