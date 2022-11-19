import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/constant/failure_constants.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entity/post.dart';
import '../../domain/entity/post_exception.dart';
import '../../domain/entity/post_failure.dart';
import '../../domain/repository/post_repo.dart';
import '../datasource/post_remote_datasource.dart';
import '../model/create_post_request.dart';
import '../model/delete_post_request.dart';

@immutable
class PostRepoImpl implements PostRepo {
  final PostRemoteDataSource _postRemoteDataSource;
  final NetworkInfo _networkInfo;
  const PostRepoImpl(this._postRemoteDataSource, this._networkInfo);

  @override
  Future<Either<PostFailure, PostEntity>> createPost(CreatePostRequest request) async {
    if (await _networkInfo.isConnected) {
      try {
        final postModel = await _postRemoteDataSource.createPost(request);
        final postEntity = PostEntity.fromPostModel(postModel);

        return Right(postEntity);
      } on PostException catch (postErr) {
        final message = postErr.message;
        final code = postErr.code;
        return Left(PostFailure(message: message, code: code));
      } catch (_) {
        const message = FailureMessages.unknownFailure;
        const code = FailureCodes.unknownFailure;
        return const Left(PostFailure(message: message, code: code));
      }
    } else {
      const message = FailureMessages.noInternetConnectionFailure;
      const code = FailureCodes.noInternetConnectionFailure;
      return const Left(PostFailure(message: message, code: code));
    }
  }

  @override
  Future<Either<PostFailure, PostEntity>> deletePost(DeletePostRequest request) async {
    if (await _networkInfo.isConnected) {
      try {
        final postModel = await _postRemoteDataSource.deletePost(request);
        final postEntity = PostEntity.fromPostModel(postModel);

        return Right(postEntity);
      } on PostException catch (postErr) {
        final message = postErr.message;
        final code = postErr.code;
        return Left(PostFailure(message: message, code: code));
      } catch (_) {
        const message = FailureMessages.unknownFailure;
        const code = FailureCodes.unknownFailure;
        return const Left(PostFailure(message: message, code: code));
      }
    } else {
      const message = FailureMessages.noInternetConnectionFailure;
      const code = FailureCodes.noInternetConnectionFailure;
      return const Left(PostFailure(message: message, code: code));
    }
  }
}
