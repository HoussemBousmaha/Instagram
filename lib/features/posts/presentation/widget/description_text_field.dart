import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../constants/enums.dart';
import '../provider/notifier/post_info_notifier_provider.dart';

class DescriptionTextField extends HookConsumerWidget {
  const DescriptionTextField({Key? key, required this.type}) : super(key: key);

  final FileType type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final controller = useTextEditingController();

    useEffect(
      () {
        controller.addListener(
          () => ref.read(postInfoNotifierProvider(type).notifier).updateDescription(controller.text),
        );
        return null;
      },
    );
    return Container(
      width: size.width * .9,
      height: size.height * .1,
      alignment: Alignment.center,
      child: TextField(
        controller: controller,
        textInputAction: TextInputAction.done,
        style: const TextStyle(fontSize: 18),
        cursorColor: Colors.grey,
        decoration: const InputDecoration(
          hintText: 'Description',
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        ),
      ),
    );
  }
}
