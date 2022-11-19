import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../provider/dependencies/auth_providers.dart';
import '../provider/notifier/auth_notifier_provider.dart';

abstract class AuthFailureDialogHandler {
  static void handle(WidgetRef ref) {
    ref.listen(authFailureProvider, (_, authFailure) {
      if (authFailure != null) {
        showDialog(
          context: ref.context,
          builder: (context) => AlertDialog(
            title: const Text('Error'),
            content: Text(authFailure.message),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  ref.read(authNotifierProvider.notifier).resetState();
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    });
  }

  const AuthFailureDialogHandler._();
}
