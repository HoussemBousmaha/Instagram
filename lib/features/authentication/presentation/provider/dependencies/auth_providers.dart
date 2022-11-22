import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../notifier/auth_notifier.dart';
import '../state/auth_state.dart';

part 'auth_providers.g.dart';

@Riverpod(keepAlive: true)
bool authenticated(AuthenticatedRef ref) {
  final authState = ref.watch(authNotifierProvider);
  return authState is Authenticated;
}
