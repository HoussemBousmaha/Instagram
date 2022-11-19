import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PickImageAgainButton extends HookConsumerWidget {
  const PickImageAgainButton({Key? key, required this.onTap}) : super(key: key);

  final Future<void> Function() onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;

    return Positioned(
      left: size.width * .04,
      top: size.width * .04,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withAlpha(100),
            borderRadius: BorderRadius.circular(6),
          ),
          padding: const EdgeInsets.all(8),
          child: Icon(Icons.photo, size: size.width * .07),
        ),
      ),
    );
  }
}
