import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/entity/auth_failure.dart';
import '../../../domain/entity/auth_user.dart';
import '../notifier/auth_notifier_provider.dart';

final authenticatedProvider = StateProvider<bool>((ref) {
  final authenticated = ref.watch(
    authNotifierProvider.select(
      (state) {
        final user = state.value?.user;
        final failure = state.value?.failure;

        return user != null && failure == null;
      },
    ),
  );

  return authenticated;
});

final authIsLoadingProvider = StateProvider<bool>((ref) {
  final isLoading = ref.watch(authNotifierProvider.select((state) => state.isLoading));

  return isLoading;
});

final authFailureProvider = Provider<AuthFailure?>((ref) {
  final authState = ref.watch(authNotifierProvider);

  final failure = authState.value?.failure;
  return failure;
});

final currentUserProvider = Provider<AuthUser?>((ref) {
  final user = ref.watch(authNotifierProvider.select((state) => state.value?.user));

  return user;
});
