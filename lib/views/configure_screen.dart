import 'package:flutter/material.dart';
import 'package:flutter_prj_mj/services/authentication_repo.dart';
import 'package:flutter_prj_mj/views/sign_up_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ConfigureScreen extends ConsumerWidget {
  static String routeURL = "/configure";
  static String routeName = "configure";
  const ConfigureScreen({super.key});

  void _onPressedSignOutIcon(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Sign Out'),
          content: const Text('Are you sure you want to sign out?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                ref.read(authRepoProvider).signOut();
                context.goNamed(SignUpScreen.routeName);
              },
              child: const Text('Sign Out'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Configure"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            ListTile(
              title: const Text("Sign Out"),
              trailing: IconButton(
                icon: const Icon(Icons.exit_to_app),
                onPressed: () => _onPressedSignOutIcon(context, ref),
              ),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
