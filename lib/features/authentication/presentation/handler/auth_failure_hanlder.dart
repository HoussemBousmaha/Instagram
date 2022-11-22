import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../provider/notifier/auth_notifier.dart';
import '../provider/state/auth_state.dart';

abstract class AuthFailureDialogHandler {
  static void handle(WidgetRef ref) {
    final authNotifier = ref.read(authNotifierProvider.notifier);
    ref.listen(authNotifierProvider, (_, state) {
      if (state is Unauthenticated) {
        showDialog(
          context: ref.context,
          builder: (context) => AlertDialog(
            title: const Text('Error'),
            content: Text(state.authFailure.message),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  authNotifier.state = const AuthState.initial();
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
