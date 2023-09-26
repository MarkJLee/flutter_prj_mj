import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_prj_mj/firebase_options.dart';
import 'package:flutter_prj_mj/utils/routes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  // glue code for Flutter & Firebase
  WidgetsFlutterBinding.ensureInitialized();

  // initialize Firebase SDK
  await Firebase.initializeApp(
    name: "flutter_prj_mj",
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: MoodJournalApp(),
    ),
  );
}

class MoodJournalApp extends ConsumerWidget {
  const MoodJournalApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: ref.watch(routerProvider),
      title: 'Mood Journal',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
