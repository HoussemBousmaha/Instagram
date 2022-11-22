import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/base/usecase/base_usecase.dart';
import '../../data/model/delete_post_request.dart';
import '../entity/post.dart';
import '../entity/post_failure.dart';
import '../repository/post_repo.dart';

@immutable
class DeletePostUseCase extends BaseUseCase<PostEntity, PostFailure, DeletePostUseCaseParams> {
  final PostRepo _postRepo;

  const DeletePostUseCase(this._postRepo);

  @override
  Future<Either<PostFailure, PostEntity>> call(DeletePostUseCaseParams params) async {
    final request = DeletePostRequest(post: params.post);
    return await _postRepo.deletePost(request);
  }
}

@immutable
class DeletePostUseCaseParams {
  final PostEntity post;

  const DeletePostUseCaseParams(this.post);
}
