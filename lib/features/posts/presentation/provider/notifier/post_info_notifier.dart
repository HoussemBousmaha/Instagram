import 'dart:io';

import 'package:instagram/features/posts/presentation/constants/enums.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/entity/post_info.dart';
import '../../../domain/entity/post_settings.dart';

part 'post_info_notifier.g.dart';

abstract class PostInfoNotifierInterface {
  void setDescription(String description);
  void setFile(File file);
  void setAspectRatio(double aspectRatio);
  void setSettings(PostSettings settings);
}

@riverpod
class PostInfoNotifier extends _$PostInfoNotifier implements PostInfoNotifierInterface {
  @override
  PostInfo build(FileType type) => PostInfo.initial(type);

  @override
  void setDescription(String description) {
    final newState = PostInfo(
      file: state.file,
      description: description,
      aspectRatio: state.aspectRatio,
      type: state.type,
      settings: state.settings,
    );
    state = newState;
  }

  @override
  void setFile(File file) {
    final newState = PostInfo(
      file: file,
      description: state.description,
      aspectRatio: state.aspectRatio,
      type: state.type,
      settings: state.settings,
    );
    state = newState;
  }

  @override
  void setAspectRatio(double aspectRatio) {
    final newState = PostInfo(
      aspectRatio: aspectRatio,
      description: state.description,
      file: state.file,
      type: state.type,
      settings: state.settings,
    );
    state = newState;
  }

  @override
  void setSettings(PostSettings settings) {
    final newState = PostInfo(
      aspectRatio: state.aspectRatio,
      description: state.description,
      file: state.file,
      type: state.type,
      settings: settings,
    );
    state = newState;
  }
}
