import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../dialog/loading_dialog.dart';
import '../provider/view_state_loading_provider.dart';

@immutable
abstract class LoadingDialogHandler {
  static void handle(WidgetRef ref) {
    ref.listen(isLoadingProvider, (_, isLoading) {
      if (isLoading) {
        showDialog(
          context: ref.context,
          barrierDismissible: false,
          builder: (context) => const LoadingDialog(),
        );
      } else {
        if (Navigator.canPop(ref.context)) {
          Navigator.pop(ref.context);
        }
      }
    });
  }

  const LoadingDialogHandler._();
}
