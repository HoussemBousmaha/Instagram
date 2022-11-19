import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../route/router.dart';

class InstagramApp extends HookConsumerWidget {
  const InstagramApp._();

  static InstagramApp instance = const InstagramApp._();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
        ),
        brightness: Brightness.dark,
      ),
    );
  }
}
