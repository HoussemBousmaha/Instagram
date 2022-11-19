import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/handler/loading_dialog_handler.dart';
import '../../../authentication/presentation/provider/dependencies/auth_providers.dart';
import '../../domain/entity/post.dart';
import '../handler/post_failure_handler.dart';
import '../widget/preview_network_image_or_video.dart';

class PostDetails extends HookConsumerWidget {
  const PostDetails({super.key, required this.post});

  final PostEntity post;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final currentUser = ref.watch(currentUserProvider);

    LoadingDialogHandler.handle(ref);
    PostFailureDialogHandler.handle(ref);

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
                    TextSpan(
                      text: '${currentUser?.name}  ',
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w900),
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
