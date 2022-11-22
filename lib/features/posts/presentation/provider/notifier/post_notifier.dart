import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../core/dependencies/app_dependecies.dart';
import '../../../domain/entity/post.dart';
import '../../../domain/entity/post_info.dart';
import '../../../domain/usecase/create_post_usecase.dart';
import '../../../domain/usecase/delete_post_usecase.dart';
import '../../constants/enums.dart';
import '../../extension/post_extensions.dart';
import '../dependencies/post_dependencies.dart';
import '../state/post_state.dart';

part 'post_notifier.g.dart';

@immutable
abstract class PostNotifierInterface {
  Future<void> createPost(PostInfo postInfo);
  Future<void> deletePost(PostEntity post);
  Future<File?> pickImage();
  Future<File?> pickVideo();
}

@riverpod
class PostNotifier extends _$PostNotifier implements PostNotifierInterface {
  @override
  PostState build() {
    return const PostState.initial();
  }

  @override
  Future<void> createPost(PostInfo postInfo) async {
    state = const PostState.loading();

    final file = postInfo.file;
    final description = postInfo.description;
    final aspectRatio = postInfo.aspectRatio;

    if (file == null || aspectRatio == null || description == null) return;

    final type = postInfo.type;
    final settings = postInfo.settings;
    final thumbnail = type == FileType.image ? file.imageThumb : await file.videoThumb;

    final createPostUseCase = ref.read(createPostUseCaseProvider);

    final params = CreatePostUseCaseParams(
      imageFile: file,
      thumbnailFile: thumbnail,
      type: type,
      description: description,
      aspectRatio: aspectRatio,
      settings: settings,
    );

    final result = await createPostUseCase(params);

    state = result.fold(
      (failure) {
        log('Post creation failed: $failure');
        return PostState.failure(failure);
      },
      (post) {
        log('Post created: $post');
        return PostState.success(post);
      },
    );
  }

  @override
  Future<void> deletePost(PostEntity post) async {
    state = const PostState.loading();

    final deletePostUseCase = ref.read(deletePostUseCaseProvider);
    final params = DeletePostUseCaseParams(post);

    final result = await deletePostUseCase(params);

    state = result.fold(
      (failure) {
        log('Post deletion failed: $failure');
        return PostState.failure(failure);
      },
      (post) {
        log('Post deleted: $post');
        return PostState.success(post);
      },
    );
  }

  @override
  Future<File?> pickImage() async {
    state = const PostState.loading();

    final imagePicker = ref.read(imagePickerProvider);
    const imageSource = ImageSource.gallery;

    final imageXFile = await imagePicker.pickImage(source: imageSource);

    state = const PostState.initial();

    if (imageXFile == null) return null;

    final imageFile = File(imageXFile.path);

    return imageFile;
  }

  @override
  Future<File?> pickVideo() async {
    state = const PostState.loading();

    final imagePicker = ref.read(imagePickerProvider);
    const videoSource = ImageSource.gallery;

    final videoXFile = await imagePicker.pickVideo(source: videoSource);

    state = const PostState.initial();

    if (videoXFile == null) return null;

    final videoFile = File(videoXFile.path);

    return videoFile;
  }
}
