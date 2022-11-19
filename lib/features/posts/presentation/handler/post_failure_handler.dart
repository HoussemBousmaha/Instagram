import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../provider/dependencies/post_providers.dart';
import '../provider/notifier/post_notifier_provider.dart';

abstract class PostFailureDialogHandler {
  static Future<void> handle(WidgetRef ref) async {
    ref.listen(postFailureProvider, (_, postFailure) {
      if (postFailure != null) {
        showDialog(
          context: ref.context,
          builder: (context) => AlertDialog(
            title: const Text('Error'),
            content: Text(postFailure.message),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  ref.read(postNotifierProvider.notifier).resetState();
                  context.go('/posts');
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    });
  }
}
