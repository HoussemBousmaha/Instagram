import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../constants/enums.dart';
import '../provider/notifier/post_info_notifier_provider.dart';
import '../provider/notifier/post_settings_notifier_provider.dart';

class PostSettingsCard extends HookConsumerWidget {
  const PostSettingsCard({Key? key, required this.type}) : super(key: key);

  final FileType type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final isLikeable = useState(true);
    final isCommentable = useState(true);

    // final postSettings = ref.watch(postSettingsNotifierProvider);
    // final postInfo = ref.watch(postInfoNotifierProvider(type));

    return SizedBox(
      width: size.width * .9,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Allow likes',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              Switch.adaptive(
                thumbColor: MaterialStateProperty.all(Colors.white),
                activeColor: Colors.blueGrey,
                value: isCommentable.value,
                onChanged: (value) {
                  isCommentable.value = value;
                  ref.read(postSettingsNotifierProvider.notifier).setIsCommentable(value);

                  final postSettings = ref.read(postSettingsNotifierProvider);

                  ref.read(postInfoNotifierProvider(type).notifier).setSettings(postSettings);
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Allow comments',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              Switch.adaptive(
                thumbColor: MaterialStateProperty.all(Colors.white),
                activeColor: Colors.blueGrey,
                value: isLikeable.value,
                onChanged: (value) {
                  isLikeable.value = value;
                  ref.read(postSettingsNotifierProvider.notifier).setIsLikeable(value);

                  final postSettings = ref.read(postSettingsNotifierProvider);

                  ref.read(postInfoNotifierProvider(type).notifier).setSettings(postSettings);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
