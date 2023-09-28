import 'package:flutter/material.dart';
import 'package:flutter_prj_mj/views/configure_screen.dart';
import 'package:flutter_prj_mj/views/home_screen.dart';
import 'package:flutter_prj_mj/views/post_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends ConsumerStatefulWidget {
  static String routeURL = "/main";
  static String routeName = "main";
  const MainScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  int _selectedIndex = 0;
  static final List<Widget> _screens = <Widget>[
    const HomeScreen(),
    const PostScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onTapSettingIcon(BuildContext context) {
    context.pushNamed(ConfigureScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mood Journal"),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 10),
              child: GestureDetector(
                  onTap: () => _onTapSettingIcon(context),
                  child: const Icon(Icons.settings_suggest))),
        ],
      ),
      body: _screens.elementAt(_selectedIndex),
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
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
