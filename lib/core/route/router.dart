import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../features/authentication/presentation/provider/dependencies/auth_providers.dart';
import '../../features/authentication/presentation/view/home.dart';
import '../../features/authentication/presentation/view/navigation.dart';
import '../../features/authentication/presentation/view/register.dart';
import '../../features/authentication/presentation/view/signin.dart';
import '../../features/posts/domain/entity/post.dart';
import '../../features/posts/presentation/view/post_details.dart';
import '../../features/posts/presentation/view/posts.dart';
import '../../features/posts/presentation/view/upload_photo.dart';
import '../../features/posts/presentation/view/upload_video.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

final routerProvider = Provider<GoRouter>((ref) {
  final authenticated = ref.watch(authenticatedProvider);

  return GoRouter(
    navigatorKey: rootNavigatorKey,
    redirect: (context, state) {
      final location = state.location;

      final goingToSignIn = location == '/signin';
      final goingToRegister = location == '/register';
      final goingToHome = location == '/posts';

      if (goingToSignIn) return authenticated ? '/posts' : '/signin';
      if (goingToRegister) return authenticated ? '/posts' : '/register';
      if (goingToHome) return authenticated ? null : '/signin';

      return null;
    },
    routes: [
      ShellRoute(
        navigatorKey: shellNavigatorKey,
        builder: (context, state, child) => NavView(key: state.pageKey, child: child),
        routes: [
          GoRoute(
            path: '/posts',
            builder: (context, state) => PostsView(key: state.pageKey),
            routes: [
              GoRoute(
                path: 'post_details',
                builder: (context, state) {
                  final post = state.extra as PostEntity;
                  return PostDetails(key: state.pageKey, post: post);
                },
              ),
            ],
          ),
          GoRoute(path: '/home', builder: (context, state) => HomeView(key: state.pageKey)),
        ],
      ),
      GoRoute(path: '/upload-video', builder: (context, state) => UploadVideoView(key: state.pageKey)),
      GoRoute(path: '/upload-image', builder: (context, state) => UplaodImageView(key: state.pageKey)),
      GoRoute(path: '/signin', builder: (context, state) => SignInView(key: state.pageKey)),
      GoRoute(path: '/register', builder: (context, state) => RegisterView(key: state.pageKey)),
    ],
    initialLocation: '/signin',
  );
});
