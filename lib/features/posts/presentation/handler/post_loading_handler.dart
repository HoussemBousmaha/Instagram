import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/dialog/loading_dialog.dart';
import '../provider/notifier/post_notifier.dart';
import '../provider/state/post_state.dart';

abstract class PostLoadingDialogHandler {
  static Future<void> handle(WidgetRef ref) async {
    ref.listen(
      postNotifierProvider,
      (_, state) {
        if (state is PostLoading) {
          showDialog(context: ref.context, builder: (context) => const LoadingDialog());
        } else {
          Navigator.pop(ref.context);
        }
      },
    );
  }
}
