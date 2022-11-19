import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../data/model/create_post_request.dart';
import '../../data/model/delete_post_request.dart';
import '../entity/post.dart';
import '../entity/post_failure.dart';

@immutable
abstract class PostRepo {
  Future<Either<PostFailure, PostEntity>> createPost(CreatePostRequest request);
  Future<Either<PostFailure, PostEntity>> deletePost(DeletePostRequest request);

  const PostRepo();
}
