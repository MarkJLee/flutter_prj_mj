import 'package:flutter/material.dart';
import 'package:flutter_prj_mj/utils/utils.dart';
import 'package:flutter_prj_mj/viewmodels/sign_in_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInScreen extends ConsumerWidget {
  static String routeURL = "/signin";
  static String routeName = "signIn";
  SignInScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _onPressedLogin(BuildContext context, WidgetRef ref) {
    ref.read(loginProvider.notifier).login(
          _emailController.text,
          _passwordController.text,
          context,
        );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mood Journal"),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.1,
            vertical: MediaQuery.of(context).size.height * 0.01,
          ),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image(
                          width: MediaQuery.of(context).size.width * 0.6,
                          image: const AssetImage(
                              "assets/images/moodJournal_icon.png"),
                        ),
                        Text(
                          "WELCOME",
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: _emailController,
                          decoration: const InputDecoration(
                            labelText: "Email",
                            hintText: "Enter your email",
                          ),
                          validator: emailValidator,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: _passwordController,
                          decoration: const InputDecoration(
                            labelText: "Password",
                            hintText: "Enter your password",
                          ),
                          obscureText: true,
                          validator: passwordValidator,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: FilledButton(
                            onPressed: () => _onPressedLogin(context, ref),
                            child: const Text(
                              "Login",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
