import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/base/usecase/base_usecase.dart';
import '../../data/model/create_post_request.dart';
import '../../presentation/constants/enums.dart';
import '../entity/post.dart';
import '../entity/post_failure.dart';
import '../repository/post_repo.dart';

@immutable
class CreatePostUseCase extends BaseUseCase<PostEntity, PostFailure, CreatePostUseCaseParams> {
  final PostRepo _postRepo;

  const CreatePostUseCase(this._postRepo);

  @override
  Future<Either<PostFailure, PostEntity>> call(CreatePostUseCaseParams params) async {
    final request = CreatePostRequest(
      file: params.imageFile,
      thumbnail: params.thumbnailFile,
      description: params.description,
      type: params.type,
      aspectRatio: params.aspectRatio,
    );
    return await _postRepo.createPost(request);
  }
}

@immutable
class CreatePostUseCaseParams {
  final File imageFile;
  final Uint8List thumbnailFile;
  final String description;
  final FileType type;
  final double aspectRatio;

  const CreatePostUseCaseParams({
    required this.imageFile,
    required this.thumbnailFile,
    required this.description,
    required this.type,
    required this.aspectRatio,
  });
}
