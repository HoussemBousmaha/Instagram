import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../state/auth_state.dart';
import 'auth_notifier.dart';

final authNotifierProvider = AsyncNotifierProvider<AuthNotifier, AuthState>(
  () => AuthNotifierImpl(),
);
