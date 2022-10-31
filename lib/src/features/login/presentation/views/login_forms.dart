import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wareco_2/src/features/login/login.dart';
import 'package:wareco_2/src/global/language/language_provider.dart';
import 'package:wareco_2/src/widgets/my_max_width_button.dart';

class LoginForms extends ConsumerStatefulWidget {
  const LoginForms({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _LoginFormsState();
}

class _LoginFormsState extends ConsumerState<LoginForms> {
  final formKey = GlobalKey<FormState>();
  bool secured = true;
  late final TextEditingController usernameController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lan = ref.watch(languageProvider);

    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            validator: (value) {
              if (value == null || value.length < 4) {
                return lan.atLeast4Characters;
              }
              return null;
            },
            controller: usernameController,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              prefixIcon: const Icon(Icons.person_rounded),
              hintText: lan.username,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 40, top: 20),
            child: TextFormField(
              validator: (value) {
                if (value == null || value.length < 4) {
                  return lan.atLeast4Characters;
                }
                return null;
              },
              controller: passwordController,
              textInputAction: TextInputAction.done,
              obscureText: secured,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.lock_rounded),
                hintText: lan.password,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      secured = !secured;
                    });
                  },
                  icon: Icon(
                    secured
                        ? Icons.visibility_rounded
                        : Icons.visibility_off_rounded,
                  ),
                ),
              ),
            ),
          ),
          Consumer(
            builder: (context, ref, _) {
              final loading = ref.watch(loginProvider) is LoginLoadingState;

              return MyMaxWidthButton(
                onPressed: loading
                    ? null
                    : () {
                        if (formKey.currentState!.validate()) {
                          ref.read(loginProvider.notifier).pressLoginButton(
                                username: usernameController.text,
                                password: passwordController.text,
                              );
                        }
                      },
                text: loading ? lan.waiting : lan.login,
              );
            },
          ),
        ],
      ),
    );
  }
}
