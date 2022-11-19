import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/handler/loading_dialog_handler.dart';
import '../handler/auth_failure_hanlder.dart';
import '../provider/notifier/auth_notifier_provider.dart';

class SignInView extends HookConsumerWidget {
  const SignInView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    LoadingDialogHandler.handle(ref);
    AuthFailureDialogHandler.handle(ref);

    final authNotifier = ref.read(authNotifierProvider.notifier);
    final emailController = useTextEditingController(text: 'test@test.com');
    final passwordController = useTextEditingController(text: '123456');

    return Scaffold(
      appBar: AppBar(title: const Text('Sign In')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: emailController,
                decoration: const InputDecoration(hintText: 'Email'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                onSubmitted: (value) {
                  authNotifier.signInWithEmailAndPassword(
                    emailController.text,
                    passwordController.text,
                  );
                  emailController.clear();
                  passwordController.clear();
                },
                decoration: const InputDecoration(hintText: 'Password'),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                authNotifier.signInWithEmailAndPassword(
                  emailController.text,
                  passwordController.text,
                );
                emailController.clear();
                passwordController.clear();
              },
              child: const Text('Sign In'),
            ),
            const SizedBox(height: 20),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Sign Up',
                    style: const TextStyle(color: Colors.blue),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        context.go('/signup');
                      },
                  ),
                ],
                text: 'Don\'t have an account?  ',
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () => authNotifier.signInWithGoogle(),
                  icon: const FaIcon(FontAwesomeIcons.google, color: Colors.white),
                ),
                const SizedBox(width: 30),
                IconButton(
                  onPressed: () => ref.read(authNotifierProvider.notifier).signInWithGoogle(),
                  icon: const FaIcon(FontAwesomeIcons.facebook, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
