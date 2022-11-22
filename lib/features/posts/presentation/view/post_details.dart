import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/entity/post.dart';
import '../widget/preview_network_image_or_video.dart';

class PostDetails extends HookConsumerWidget {
  const PostDetails({super.key, required this.post});

  final PostEntity post;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Post Details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          tooltip: 'back',
          onPressed: () => context.go('/posts'),
        ),
      ),
      body: SizedBox(
        width: size.width,
        child: Column(
          children: [
            SizedBox(height: size.height * 0.05),
            PreviewNetworkVideoOrImage(post: post),
            SizedBox(height: size.height * 0.05),
            SizedBox(
              width: size.width * .9,
              child: RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: '',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w900),
                    ),
                    TextSpan(
                      text: post.description,
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
