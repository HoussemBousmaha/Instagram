import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PickVideoAgainButton extends HookConsumerWidget {
  const PickVideoAgainButton({Key? key, required this.onTap}) : super(key: key);

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
          alignment: Alignment.center,
          padding: const EdgeInsets.all(12),
          child: Icon(FontAwesomeIcons.video, size: size.width * .05),
        ),
      ),
    );
  }
}
