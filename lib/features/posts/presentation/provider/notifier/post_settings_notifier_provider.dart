import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/entity/post_settings.dart';
import 'post_settings_notifier.dart';

final postSettingsNotifierProvider = StateNotifierProvider<PostSettingsNotifier, PostSettings>(
  (ref) => PostSettingsNotifierImpl(),
);
