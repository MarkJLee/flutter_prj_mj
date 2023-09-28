import 'package:flutter_prj_mj/services/authentication_repo.dart';
import 'package:flutter_prj_mj/views/configure_screen.dart';
import 'package:flutter_prj_mj/views/home_screen.dart';
import 'package:flutter_prj_mj/views/main_screen.dart';
import 'package:flutter_prj_mj/views/sign_in_screen.dart';
import 'package:flutter_prj_mj/views/sign_up_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider((ref) {
  return GoRouter(
      initialLocation: MainScreen.routeURL,
      redirect: (context, state) {
        final isLoggedIn = ref.read(authRepoProvider).isLoggedIn;

        if (!isLoggedIn) {
          if (state.matchedLocation != SignUpScreen.routeURL &&
              state.matchedLocation != SignInScreen.routeURL) {
            return SignUpScreen.routeURL;
          }
        }
        return null;
      },
      routes: [
        GoRoute(
          name: MainScreen.routeName,
          path: MainScreen.routeURL,
          builder: (context, state) => const MainScreen(),
        ),
        GoRoute(
          name: HomeScreen.routeName,
          path: HomeScreen.routeURL,
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          name: SignUpScreen.routeName,
          path: SignUpScreen.routeURL,
          builder: (context, state) => SignUpScreen(),
        ),
        GoRoute(
          name: SignInScreen.routeName,
          path: SignInScreen.routeURL,
          builder: (context, state) => SignInScreen(),
        ),
        GoRoute(
          name: ConfigureScreen.routeName,
          path: ConfigureScreen.routeURL,
          builder: (context, state) => const ConfigureScreen(),
        ),
      ]);
});
