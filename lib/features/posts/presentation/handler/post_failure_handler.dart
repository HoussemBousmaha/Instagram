import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../provider/notifier/post_notifier.dart';
import '../provider/state/post_state.dart';

abstract class PostFailureDialogHandler {
  static Future<void> handle(WidgetRef ref) async {
    ref.listen(
      postNotifierProvider,
      (_, state) {
        if (state is PostError) {
          showDialog(
            context: ref.context,
            builder: (context) => AlertDialog(
              title: const Text('Error'),
              content: Text(state.failure.message),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    context.go('/posts');
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
