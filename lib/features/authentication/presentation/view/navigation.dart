import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/handler/loading_dialog_handler.dart';
import '../../../posts/presentation/handler/post_failure_handler.dart';
import '../handler/auth_failure_hanlder.dart';
import '../provider/notifier/auth_notifier_provider.dart';
import '../widget/bottom_navbar.dart';

class NavView extends HookConsumerWidget {
  const NavView({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authNotifier = ref.read(authNotifierProvider.notifier);

    LoadingDialogHandler.handle(ref);
    AuthFailureDialogHandler.handle(ref);
    PostFailureDialogHandler.handle(ref);

    return Scaffold(
      appBar: AppBar(
        title: Text(title(context)),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(FontAwesomeIcons.rightFromBracket),
          onPressed: () => authNotifier.signOut(),
        ),
        actions: [
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.film),
            onPressed: () {
              context.go('/upload-video');
            },
          ),
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.photoFilm),
            onPressed: () {
              context.go('/upload-image');
            },
          ),
        ],
      ),
      body: child,
      bottomNavigationBar: const BottomNavBar(),
    );
  }

  String title(context) {
    final location = GoRouter.of(context).location;
    if (location == '/home') return 'Home';
    if (location == '/posts') return 'Posts';

    return 'Home';
  }
}
