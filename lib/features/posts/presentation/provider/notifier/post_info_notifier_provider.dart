import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/entity/post_info.dart';
import '../../constants/enums.dart';
import 'post_info_notifier.dart';

final postInfoNotifierProvider = StateNotifierProvider.family<PostInfoNotifier, PostInfo, FileType>(
  (ref, FileType type) => PostInfoNotifierImpl(type),
);
