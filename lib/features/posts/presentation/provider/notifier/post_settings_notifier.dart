import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/entity/post_settings.dart';

abstract class PostSettingsNotifier extends StateNotifier<PostSettings> {
  PostSettingsNotifier() : super(PostSettings.initial());

  void setIsLikeable(bool isLikeable);
  void setIsCommentable(bool isCommentable);
}

class PostSettingsNotifierImpl extends PostSettingsNotifier {
  PostSettingsNotifierImpl() : super();

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
