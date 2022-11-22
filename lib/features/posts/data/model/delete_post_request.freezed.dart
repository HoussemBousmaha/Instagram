// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'delete_post_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DeletePostRequest {
  PostEntity get post => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DeletePostRequestCopyWith<DeletePostRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeletePostRequestCopyWith<$Res> {
  factory $DeletePostRequestCopyWith(
          DeletePostRequest value, $Res Function(DeletePostRequest) then) =
      _$DeletePostRequestCopyWithImpl<$Res, DeletePostRequest>;
  @useResult
  $Res call({PostEntity post});

  $PostEntityCopyWith<$Res> get post;
}

/// @nodoc
class _$DeletePostRequestCopyWithImpl<$Res, $Val extends DeletePostRequest>
    implements $DeletePostRequestCopyWith<$Res> {
  _$DeletePostRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? post = null,
  }) {
    return _then(_value.copyWith(
      post: null == post
          ? _value.post
          : post // ignore: cast_nullable_to_non_nullable
              as PostEntity,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PostEntityCopyWith<$Res> get post {
    return $PostEntityCopyWith<$Res>(_value.post, (value) {
      return _then(_value.copyWith(post: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_DeletePostRequestCopyWith<$Res>
    implements $DeletePostRequestCopyWith<$Res> {
  factory _$$_DeletePostRequestCopyWith(_$_DeletePostRequest value,
          $Res Function(_$_DeletePostRequest) then) =
      __$$_DeletePostRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PostEntity post});

  @override
  $PostEntityCopyWith<$Res> get post;
}

/// @nodoc
class __$$_DeletePostRequestCopyWithImpl<$Res>
    extends _$DeletePostRequestCopyWithImpl<$Res, _$_DeletePostRequest>
    implements _$$_DeletePostRequestCopyWith<$Res> {
  __$$_DeletePostRequestCopyWithImpl(
      _$_DeletePostRequest _value, $Res Function(_$_DeletePostRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? post = null,
  }) {
    return _then(_$_DeletePostRequest(
      post: null == post
          ? _value.post
          : post // ignore: cast_nullable_to_non_nullable
              as PostEntity,
    ));
  }
}

/// @nodoc

class _$_DeletePostRequest implements _DeletePostRequest {
  const _$_DeletePostRequest({required this.post});

  @override
  final PostEntity post;

  @override
  String toString() {
    return 'DeletePostRequest(post: $post)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeletePostRequest &&
            (identical(other.post, post) || other.post == post));
  }

  @override
  int get hashCode => Object.hash(runtimeType, post);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeletePostRequestCopyWith<_$_DeletePostRequest> get copyWith =>
      __$$_DeletePostRequestCopyWithImpl<_$_DeletePostRequest>(
          this, _$identity);
}

abstract class _DeletePostRequest implements DeletePostRequest {
  const factory _DeletePostRequest({required final PostEntity post}) =
      _$_DeletePostRequest;

  @override
  PostEntity get post;
  @override
  @JsonKey(ignore: true)
  _$$_DeletePostRequestCopyWith<_$_DeletePostRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
