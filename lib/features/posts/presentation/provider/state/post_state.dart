// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constant/enum.dart';
import '../../../domain/entity/post.dart';
import '../../../domain/entity/post_failure.dart';

@immutable
class PostState extends Equatable {
  final PostEntity? post;
  final PostFailure? failure;
  final ViewState viewState;

  const PostState({this.post, this.failure, required this.viewState});

  factory PostState.initial() => const PostState(viewState: ViewState.initial);
  factory PostState.success(PostEntity post) => PostState(post: post, viewState: ViewState.success);
  factory PostState.failure(PostFailure failure) => PostState(failure: failure, viewState: ViewState.failure);

  PostState copyWith({
    PostEntity? post,
    PostFailure? failure,
    ViewState? viewState,
  }) {
    return PostState(post: post ?? this.post, failure: failure ?? this.failure, viewState: viewState ?? this.viewState);
  }

  @override
  List<Object?> get props => [post, failure, viewState];

  @override
  bool get stringify => true;
}
