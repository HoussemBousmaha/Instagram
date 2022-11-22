import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../provider/dependencies/post_providers.dart';

class PostsView extends HookConsumerWidget {
  const PostsView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) => const PostsGrid();
}

class PostsGrid extends HookConsumerWidget {
  const PostsGrid({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postsAsyncValue = ref.watch(postsStreamProvider);
    return postsAsyncValue.maybeWhen(
      orElse: () => const Center(child: CircularProgressIndicator.adaptive()),
      data: (posts) {
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 3,
            crossAxisSpacing: 3,
          ),
          itemCount: posts.length,
          itemBuilder: (context, index) {
            final post = posts.toList()[index];
            return GestureDetector(
              onTap: () {
                context.replace('/posts/post_details', extra: post);
              },
              child: Image.network(
                post.thumbnailUrl,
                fit: BoxFit.cover,
                errorBuilder: ((context, error, stackTrace) {
                  return const Center(child: CircularProgressIndicator.adaptive());
                }),
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const Center(child: CircularProgressIndicator.adaptive());
                },
              ),
            );
          },
        );
      },
    );
  }
}
