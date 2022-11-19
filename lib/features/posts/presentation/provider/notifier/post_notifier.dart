import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/constant/enum.dart';
import '../../../../../core/dependencies/app_dependecies.dart';
import '../../../domain/entity/post.dart';
import '../../../domain/entity/post_failure.dart';
import '../../../domain/entity/post_info.dart';
import '../../../domain/usecase/create_post_usecase.dart';
import '../../../domain/usecase/delete_post_usecase.dart';
import '../../constants/enums.dart';
import '../../extension/post_extensions.dart';
import '../dependencies/post_dependencies.dart';
import '../state/post_state.dart';

@immutable
abstract class PostNotifier extends AsyncNotifier<PostState> {
  Future<void> createPost(PostInfo postInfo);
  Future<void> deletePost(PostEntity post);
  Future<File?> pickImage();
  Future<File?> pickVideo();
  void resetState();
}

typedef AsyncPostState = AsyncValue<PostState>;

@immutable
class PostNotifierImpl extends PostNotifier {
  @override
  FutureOr<PostState> build() async {
    return PostState.initial();
  }

  @override
  void resetState() {
    postState = PostState.initial();
  }

  set postState(PostState postState) {
    state = AsyncPostState.data(postState);
  }

  set postSuccess(PostEntity post) {
    postState = PostState.success(post);
  }

  set postFailure(PostFailure failure) {
    postState = PostState.failure(failure);
  }

  set isLoading(bool isLoading) {
    postState = state.value?.copyWith(
          viewState: isLoading ? ViewState.loading : ViewState.initial,
        ) ??
        PostState.initial();
  }

  @override
  Future<void> createPost(PostInfo postInfo) async {
    isLoading = true;

    late final Uint8List thumbnail;

    final type = postInfo.type;
    final file = postInfo.file;
    final description = postInfo.description;
    final aspectRatio = postInfo.aspectRatio;
    final settings = postInfo.settings;

    if (file == null || aspectRatio == null || description == null) return;

    if (type == FileType.image) {
      thumbnail = file.imageThumb;
    } else if (type == FileType.video) {
      thumbnail = await file.videoThumb;
    }

    final result = await ref.refresh(createPostUseCaseProvider)(
      CreatePostUseCaseParams(
        imageFile: file,
        thumbnailFile: thumbnail,
        type: type,
        description: description,
        aspectRatio: aspectRatio,
        settings: settings,
      ),
    );

    result.fold(
      (failure) {
        debugPrint('create post failure: $failure');
        postFailure = failure;
      },
      (post) {
        debugPrint('create post success');
        postSuccess = post;
      },
    );
  }

  @override
  Future<void> deletePost(PostEntity post) async {
    isLoading = true;

    final result = await ref.refresh(deletePostUseCaseProvider)(DeletePostUseCaseParams(post));

    result.fold(
      (failure) {
        debugPrint('delete post failure: $failure');
        postFailure = failure;
      },
      (post) {
        debugPrint('delete post success');
        postSuccess = post;
      },
    );
  }

  @override
  Future<File?> pickImage() async {
    isLoading = true;

    final imageXFile = await ref.read(imagePickerProvider).pickImage(source: ImageSource.gallery);

    isLoading = false;

    if (imageXFile == null) return null;

    final imageFile = File(imageXFile.path);

    return imageFile;
  }

  @override
  Future<File?> pickVideo() async {
    isLoading = true;

    final videoXFile = await ref.read(imagePickerProvider).pickVideo(source: ImageSource.gallery);

    isLoading = false;

    if (videoXFile == null) return null;

    final videoFile = File(videoXFile.path);

    return videoFile;
  }
}
