import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_prj_mj/services/authentication_repo.dart';
import 'package:flutter_prj_mj/utils/utils.dart';
import 'package:flutter_prj_mj/views/main_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AuthenticationViewModel extends AsyncNotifier<void> {
  late final AuthenticationRepository _authRepo;

  @override
  FutureOr<void> build() {
    _authRepo = ref.read(authRepoProvider);
  }

  Future<void> signUp(BuildContext context) async {
    state = const AsyncValue.loading();
    final form = ref.read(signUpForm);

    state = await AsyncValue.guard(() async {
      await _authRepo.signUp(
        form["email"],
        form["password"],
      );
    });

    if (state.hasError) {
      showFirebaseErrorSnack(context, state.error);
    } else {
      context.goNamed(MainScreen.routeName);
    }
  }

  Future<void> signIn(
      String email, String password, BuildContext context) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () async => await _authRepo.signIn(email, password),
    );
    if (state.hasError) {
      showFirebaseErrorSnack(context, state.error);
    } else {
      context.goNamed(MainScreen.routeName);
    }
  }

  String? getCurrentUserId() {
    return _authRepo.getCurrentUserId();
  }
}

final signUpForm = StateProvider((ref) => {});

final authProvider = AsyncNotifierProvider<AuthenticationViewModel, void>(
  () => AuthenticationViewModel(),
);
