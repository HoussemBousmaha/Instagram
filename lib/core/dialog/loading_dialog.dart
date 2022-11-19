import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoadingDialog extends HookConsumerWidget {
  const LoadingDialog({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return Dialog(
      child: Container(
        width: size.width * .4,
        height: size.width * .4,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16),
        child: const CircularProgressIndicator.adaptive(),
      ),
    );
  }
}
