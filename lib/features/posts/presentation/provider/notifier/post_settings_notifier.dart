import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/entity/post_settings.dart';

part 'post_settings_notifier.g.dart';

abstract class PostSettingsNotifierInterface {
  void setIsLikeable(bool isLikeable);
  void setIsCommentable(bool isCommentable);
}

@riverpod
class PostSettingsNotifier extends _$PostSettingsNotifier implements PostSettingsNotifierInterface {
  @override
  PostSettings build() => PostSettings.initial();

  @override
  void setIsLikeable(bool isLikeable) {
    final newState = PostSettings(isCommentable: state.isCommentable, isLikeable: isLikeable);
    state = newState;
  }

  @override
  void setIsCommentable(bool isCommentable) {
    final newState = PostSettings(isCommentable: isCommentable, isLikeable: state.isLikeable);
    state = newState;
  }
}
