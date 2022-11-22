import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../handler/auth_failure_hanlder.dart';
import '../provider/notifier/auth_notifier.dart';

class SignInView extends HookConsumerWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController(text: 'test@test.com');
    final passwordController = useTextEditingController(text: '123456');

    final authState = ref.watch(authNotifierProvider);
    final authNotifier = ref.read(authNotifierProvider.notifier);

    AuthFailureDialogHandler.handle(ref);

    void signIn() {
      authNotifier.signInWithEmailAndPassword(emailController.text, passwordController.text);
      emailController.clear();
      passwordController.clear();
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Sign In')),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.center,
        child: authState.maybeWhen(
          orElse: () => null,
          loading: () => const CircularProgressIndicator.adaptive(),
          initial: () {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(hintText: 'Email'),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  onSubmitted: (value) => signIn(),
                  decoration: const InputDecoration(hintText: 'Password'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: signIn,
                  child: const Text('Sign In'),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Don\'t have an account?'),
                    const SizedBox(width: 10),
                    TextButton(
                      onPressed: () => context.go('/register'),
                      child: const Text('Sign Up'),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        authNotifier.signInWithGoogle();
                      },
                      icon: const FaIcon(FontAwesomeIcons.google, color: Colors.white),
                    ),
                    const SizedBox(width: 30),
                    IconButton(
                      onPressed: () {
                        authNotifier.signInWithGoogle();
                      },
                      icon: const FaIcon(FontAwesomeIcons.facebook, color: Colors.white),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
