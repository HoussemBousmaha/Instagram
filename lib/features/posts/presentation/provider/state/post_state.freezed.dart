// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'post_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PostState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PostEntity post) success,
    required TResult Function(PostFailure failure) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PostEntity post)? success,
    TResult? Function(PostFailure failure)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PostEntity post)? success,
    TResult Function(PostFailure failure)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PostInitial value) initial,
    required TResult Function(PostLoading value) loading,
    required TResult Function(PostSuccess value) success,
    required TResult Function(PostError value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PostInitial value)? initial,
    TResult? Function(PostLoading value)? loading,
    TResult? Function(PostSuccess value)? success,
    TResult? Function(PostError value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PostInitial value)? initial,
    TResult Function(PostLoading value)? loading,
    TResult Function(PostSuccess value)? success,
    TResult Function(PostError value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostStateCopyWith<$Res> {
  factory $PostStateCopyWith(PostState value, $Res Function(PostState) then) =
      _$PostStateCopyWithImpl<$Res, PostState>;
}

/// @nodoc
class _$PostStateCopyWithImpl<$Res, $Val extends PostState>
    implements $PostStateCopyWith<$Res> {
  _$PostStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$PostInitialCopyWith<$Res> {
  factory _$$PostInitialCopyWith(
          _$PostInitial value, $Res Function(_$PostInitial) then) =
      __$$PostInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PostInitialCopyWithImpl<$Res>
    extends _$PostStateCopyWithImpl<$Res, _$PostInitial>
    implements _$$PostInitialCopyWith<$Res> {
  __$$PostInitialCopyWithImpl(
      _$PostInitial _value, $Res Function(_$PostInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PostInitial extends PostInitial {
  const _$PostInitial() : super._();

  @override
  String toString() {
    return 'PostState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PostInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PostEntity post) success,
    required TResult Function(PostFailure failure) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PostEntity post)? success,
    TResult? Function(PostFailure failure)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PostEntity post)? success,
    TResult Function(PostFailure failure)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PostInitial value) initial,
    required TResult Function(PostLoading value) loading,
    required TResult Function(PostSuccess value) success,
    required TResult Function(PostError value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PostInitial value)? initial,
    TResult? Function(PostLoading value)? loading,
    TResult? Function(PostSuccess value)? success,
    TResult? Function(PostError value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PostInitial value)? initial,
    TResult Function(PostLoading value)? loading,
    TResult Function(PostSuccess value)? success,
    TResult Function(PostError value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class PostInitial extends PostState {
  const factory PostInitial() = _$PostInitial;
  const PostInitial._() : super._();
}

/// @nodoc
abstract class _$$PostLoadingCopyWith<$Res> {
  factory _$$PostLoadingCopyWith(
          _$PostLoading value, $Res Function(_$PostLoading) then) =
      __$$PostLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PostLoadingCopyWithImpl<$Res>
    extends _$PostStateCopyWithImpl<$Res, _$PostLoading>
    implements _$$PostLoadingCopyWith<$Res> {
  __$$PostLoadingCopyWithImpl(
      _$PostLoading _value, $Res Function(_$PostLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PostLoading extends PostLoading {
  const _$PostLoading() : super._();

  @override
  String toString() {
    return 'PostState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PostLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PostEntity post) success,
    required TResult Function(PostFailure failure) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PostEntity post)? success,
    TResult? Function(PostFailure failure)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PostEntity post)? success,
    TResult Function(PostFailure failure)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PostInitial value) initial,
    required TResult Function(PostLoading value) loading,
    required TResult Function(PostSuccess value) success,
    required TResult Function(PostError value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PostInitial value)? initial,
    TResult? Function(PostLoading value)? loading,
    TResult? Function(PostSuccess value)? success,
    TResult? Function(PostError value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PostInitial value)? initial,
    TResult Function(PostLoading value)? loading,
    TResult Function(PostSuccess value)? success,
    TResult Function(PostError value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class PostLoading extends PostState {
  const factory PostLoading() = _$PostLoading;
  const PostLoading._() : super._();
}

/// @nodoc
abstract class _$$PostSuccessCopyWith<$Res> {
  factory _$$PostSuccessCopyWith(
          _$PostSuccess value, $Res Function(_$PostSuccess) then) =
      __$$PostSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({PostEntity post});

  $PostEntityCopyWith<$Res> get post;
}

/// @nodoc
class __$$PostSuccessCopyWithImpl<$Res>
    extends _$PostStateCopyWithImpl<$Res, _$PostSuccess>
    implements _$$PostSuccessCopyWith<$Res> {
  __$$PostSuccessCopyWithImpl(
      _$PostSuccess _value, $Res Function(_$PostSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? post = null,
  }) {
    return _then(_$PostSuccess(
      null == post
          ? _value.post
          : post // ignore: cast_nullable_to_non_nullable
              as PostEntity,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $PostEntityCopyWith<$Res> get post {
    return $PostEntityCopyWith<$Res>(_value.post, (value) {
      return _then(_value.copyWith(post: value));
    });
  }
}

/// @nodoc

class _$PostSuccess extends PostSuccess {
  const _$PostSuccess(this.post) : super._();

  @override
  final PostEntity post;

  @override
  String toString() {
    return 'PostState.success(post: $post)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostSuccess &&
            (identical(other.post, post) || other.post == post));
  }

  @override
  int get hashCode => Object.hash(runtimeType, post);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostSuccessCopyWith<_$PostSuccess> get copyWith =>
      __$$PostSuccessCopyWithImpl<_$PostSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PostEntity post) success,
    required TResult Function(PostFailure failure) failure,
  }) {
    return success(post);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PostEntity post)? success,
    TResult? Function(PostFailure failure)? failure,
  }) {
    return success?.call(post);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PostEntity post)? success,
    TResult Function(PostFailure failure)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(post);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PostInitial value) initial,
    required TResult Function(PostLoading value) loading,
    required TResult Function(PostSuccess value) success,
    required TResult Function(PostError value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PostInitial value)? initial,
    TResult? Function(PostLoading value)? loading,
    TResult? Function(PostSuccess value)? success,
    TResult? Function(PostError value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PostInitial value)? initial,
    TResult Function(PostLoading value)? loading,
    TResult Function(PostSuccess value)? success,
    TResult Function(PostError value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class PostSuccess extends PostState {
  const factory PostSuccess(final PostEntity post) = _$PostSuccess;
  const PostSuccess._() : super._();

  PostEntity get post;
  @JsonKey(ignore: true)
  _$$PostSuccessCopyWith<_$PostSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PostErrorCopyWith<$Res> {
  factory _$$PostErrorCopyWith(
          _$PostError value, $Res Function(_$PostError) then) =
      __$$PostErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({PostFailure failure});
}

/// @nodoc
class __$$PostErrorCopyWithImpl<$Res>
    extends _$PostStateCopyWithImpl<$Res, _$PostError>
    implements _$$PostErrorCopyWith<$Res> {
  __$$PostErrorCopyWithImpl(
      _$PostError _value, $Res Function(_$PostError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
  }) {
    return _then(_$PostError(
      null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as PostFailure,
    ));
  }
}

/// @nodoc

class _$PostError extends PostError {
  const _$PostError(this.failure) : super._();

  @override
  final PostFailure failure;

  @override
  String toString() {
    return 'PostState.failure(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostError &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostErrorCopyWith<_$PostError> get copyWith =>
      __$$PostErrorCopyWithImpl<_$PostError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PostEntity post) success,
    required TResult Function(PostFailure failure) failure,
  }) {
    return failure(this.failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PostEntity post)? success,
    TResult? Function(PostFailure failure)? failure,
  }) {
    return failure?.call(this.failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PostEntity post)? success,
    TResult Function(PostFailure failure)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this.failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PostInitial value) initial,
    required TResult Function(PostLoading value) loading,
    required TResult Function(PostSuccess value) success,
    required TResult Function(PostError value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PostInitial value)? initial,
    TResult? Function(PostLoading value)? loading,
    TResult? Function(PostSuccess value)? success,
    TResult? Function(PostError value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PostInitial value)? initial,
    TResult Function(PostLoading value)? loading,
    TResult Function(PostSuccess value)? success,
    TResult Function(PostError value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class PostError extends PostState {
  const factory PostError(final PostFailure failure) = _$PostError;
  const PostError._() : super._();

  PostFailure get failure;
  @JsonKey(ignore: true)
  _$$PostErrorCopyWith<_$PostError> get copyWith =>
      throw _privateConstructorUsedError;
}
