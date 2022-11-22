import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entity/post.dart';
import '../../../domain/entity/post_failure.dart';

part "post_state.freezed.dart";

@freezed
class PostState with _$PostState {
  const factory PostState.initial() = PostInitial;
  const factory PostState.loading() = PostLoading;
  const factory PostState.success(PostEntity post) = PostSuccess;
  const factory PostState.failure(PostFailure failure) = PostError;

  const PostState._();
}
