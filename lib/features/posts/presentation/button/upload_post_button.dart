import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../constants/enums.dart';
import '../provider/notifier/post_info_notifier.dart';
import '../provider/notifier/post_notifier.dart';

class UploadPostButton extends HookConsumerWidget {
  const UploadPostButton({Key? key, required this.type}) : super(key: key);

  final FileType type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMounted = useIsMounted();
    final size = MediaQuery.of(context).size;

    final postInfo = ref.watch(postInfoNotifierProvider(type));
    final postNotifier = ref.watch(postNotifierProvider.notifier);

    return SizedBox(
      width: size.width * 0.5,
      height: size.height * 0.06,
      child: ElevatedButton(
        onPressed: postInfo.isAllValid
            ? () async {
                await postNotifier.createPost(postInfo);

                if (!isMounted()) return;

                // ignore: use_build_context_synchronously
                context.go('/posts');
              }
            : null,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.blueGrey,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
        child: const Text('Upload', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
      ),
    );
  }
}
