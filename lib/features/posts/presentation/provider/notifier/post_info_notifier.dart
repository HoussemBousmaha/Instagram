import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/entity/post_info.dart';
import '../../../domain/entity/post_settings.dart';
import '../../constants/enums.dart';

abstract class PostInfoNotifier extends StateNotifier<PostInfo> {
  PostInfoNotifier(super.state);

  void setDescription(String description);
  void setFile(File file);
  void setAspectRatio(double aspectRatio);
  void setSettings(PostSettings settings);
}

class PostInfoNotifierImpl extends PostInfoNotifier {
  final FileType fileType;

  PostInfoNotifierImpl(this.fileType) : super(PostInfo.initial(fileType));

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
