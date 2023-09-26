import 'package:flutter_prj_mj/views/home_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider((ref) {
  return GoRouter(
      initialLocation: "/",
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
        )
      ]);
});
