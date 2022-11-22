// import 'package:hooks_riverpod/hooks_riverpod.dart';

// import '../../features/authentication/presentation/provider/notifier/auth_notifier_provider.dart';
// import '../../features/posts/presentation/provider/notifier/post_notifier_provider.dart';
// import '../constant/enum.dart';

// final isLoadingProvider = Provider<bool>((ref) {
//   final authViewState = ref.watch(authNotifierProvider.select((state) => state.value?.viewState));
//   final postViewState = ref.watch(postNotifierProvider.select((state) => state.value?.viewState));

//   if (authViewState == ViewState.loading || postViewState == ViewState.loading) return true;

//   return false;
// });
