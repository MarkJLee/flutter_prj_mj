import 'package:flutter/material.dart';
import 'package:flutter_prj_mj/views/configure_screen.dart';
import 'package:flutter_prj_mj/views/home_screen.dart';
import 'package:flutter_prj_mj/views/post_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends ConsumerWidget {
  static String routeURL = "/main";
  static String routeName = "main";
  const MainScreen({super.key});

  // final int _selectedIndex = 0;
  static final List<Widget> _screens = <Widget>[
    const HomeScreen(),
    const PostScreen(),
  ];

  static void _onItemTapped(WidgetRef ref, int index) {
    // state 변경시, .notifier 사용
    ref.read(selectedIndexProvider.notifier).state = index;
  }

  static void _onTapSettingIcon(BuildContext context) {
    context.pushNamed(ConfigureScreen.routeName);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // state 확인시 .watch(selectedIndexProvider) 사용
    final selectedIndex = ref.watch(selectedIndexProvider);
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.only(left: 15.0),
          child: Image(
            image: AssetImage("assets/images/moodJournal_icon.png"),
          ),
        ),
        title: const Text("Mood Journal"),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 10),
              child: GestureDetector(
                  onTap: () => _onTapSettingIcon(context),
                  child: const Icon(Icons.settings_suggest))),
        ],
      ),
      body: _screens.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.create),
            label: 'Post',
          ),
        ],
        currentIndex: selectedIndex,
        onTap: (index) => _onItemTapped(ref, index),
      ),
    );
  }
}

final selectedIndexProvider = StateProvider<int>((ref) => 0);
