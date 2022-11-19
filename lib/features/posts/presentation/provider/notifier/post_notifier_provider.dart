import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../state/post_state.dart';
import 'post_notifier.dart';

final postNotifierProvider = AsyncNotifierProvider<PostNotifier, PostState>(() {
  return PostNotifierImpl();
});
