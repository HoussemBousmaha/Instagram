import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BottomNavBar extends HookConsumerWidget {
  const BottomNavBar({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: const [
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.bookBookmark),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Posts',
        ),
      ],
      currentIndex: _selectedIndex(ref.context),
      onTap: (index) {
        if (index == 0) {
          context.go('/posts');
        } else if (index == 1) {
          context.go('/home');
        }
      },
    );
  }

  int _selectedIndex(BuildContext context) {
    final location = GoRouter.of(context).location;

    if (location == '/posts') {
      return 0;
    }
    if (location == '/home') {
      return 1;
    }
    return 0;
  }
}
