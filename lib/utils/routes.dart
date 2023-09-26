import 'package:flutter_prj_mj/views/home_screen.dart';
import 'package:flutter_prj_mj/views/sign_in_screen.dart';
import 'package:flutter_prj_mj/views/sign_up_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider((ref) {
  return GoRouter(
      initialLocation: "/signup",
      // redirect: (context, state) {
      //   final isLoggedIn = ref.read(authRepo).isLoggedIn;
      //   if (!isLoggedIn) {
      //     if (state.subloc != SignUpScreen.routeURL &&
      //         state.subloc != LoginScreen.routeURL) {
      //       return SignUpScreen.routeURL;
      //     }
      //   }
      //   return null;
      // },
      routes: [
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
          builder: (context, state) => const SignInScreen(),
        ),
      ]);
});
