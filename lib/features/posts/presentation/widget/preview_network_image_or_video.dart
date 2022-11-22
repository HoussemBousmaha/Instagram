import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/entity/post.dart';
import '../constants/enums.dart';
import '../provider/notifier/post_notifier.dart';
import 'card_image.dart';
import 'card_video.dart';

class PreviewNetworkVideoOrImage extends HookConsumerWidget {
  const PreviewNetworkVideoOrImage({Key? key, required this.post}) : super(key: key);

  final PostEntity post;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMounted = useIsMounted();
    final size = MediaQuery.of(context).size;
    final postNotifier = ref.read(postNotifierProvider.notifier);
    return Container(
      width: size.width * .9,
      decoration: BoxDecoration(color: Colors.grey.shade700, borderRadius: BorderRadius.circular(6)),
      alignment: Alignment.center,
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: post.aspectRatio,
            child: post.type == FileType.image
                ? ImageCard(imageUrl: post.fileUrl)
                : VideoPlayerCard(videoUrl: post.fileUrl),
          ),
          Positioned(
            top: size.height * 0.02,
            left: size.width * 0.04,
            child: GestureDetector(
              onTap: () async {
                await postNotifier.deletePost(post);

                if (!isMounted()) return;

                // ignore: use_build_context_synchronously
                context.go('/posts');
              },
              child: const Icon(Icons.delete, color: Colors.black, size: 30),
            ),
          ),
        ],
      ),
    );
  }
}
