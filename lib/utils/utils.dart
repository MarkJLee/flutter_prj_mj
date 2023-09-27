import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

String? emailValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter an email';
  }
  final bool emailValid =
      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$")
          .hasMatch(value);
  if (!emailValid) {
    return 'Please enter a valid email address';
  }
  return null;
}

String? passwordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a password';
  }
  if (value.length < 6) {
    return 'Password must be at least 6 characters';
  }
  return null;
}

void showFirebaseErrorSnack(BuildContext context, Object? error) {
  String message;
  if (error is FirebaseException) {
    message = error.message ?? "A problem has occurred.";
  } else {
    message = "An unknown error occurred: ${error.toString()}";
  }

  print("Error Details: ${error.toString()}"); // 에러 세부 정보를 로그에 출력

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      action: SnackBarAction(
        label: "OK",
        onPressed: () {},
      ),
      content: Text(message),
    ),
  );
}
