import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/entity/post_info.dart';
import '../../constants/enums.dart';

abstract class PostInfoNotifier extends StateNotifier<PostInfo> {
  PostInfoNotifier(super.state);

  void updateDescription(String description);
  void updateFile(File file);
  void updateAspectRatio(double aspectRatio);
}

class PostInfoNotifierImpl extends PostInfoNotifier {
  final FileType fileType;

  PostInfoNotifierImpl(this.fileType) : super(PostInfo.initial(fileType));

  @override
  void updateDescription(String description) {
    final newState = PostInfo(
      file: state.file,
      description: description,
      aspectRatio: state.aspectRatio,
      type: state.type,
    );
    state = newState;
  }

  @override
  void updateFile(File file) {
    final newState = PostInfo(
      file: file,
      description: state.description,
      aspectRatio: state.aspectRatio,
      type: state.type,
    );
    state = newState;
  }

  @override
  void updateAspectRatio(double aspectRatio) {
    final newState = PostInfo(
      aspectRatio: aspectRatio,
      description: state.description,
      file: state.file,
      type: state.type,
    );
    state = newState;
  }
}
