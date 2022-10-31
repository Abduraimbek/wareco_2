import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wareco_2/src/app.dart';
import 'package:wareco_2/src/features/login/login.dart';
import 'package:wareco_2/src/helpers/extensions.dart';

import 'login_forms.dart';
import 'remember_me.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    ref.listen(loginProvider, (previous, next) {
      if (next is LoginErrorState && previous is! LoginErrorState) {
        context.showSnackBar(next.error);
      }

      if (next is LoginSuccessState) {
        Navigator.of(context).pushReplacementNamed(App.homePage);
      }
    });

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: context.height * .1,
                bottom: context.height * .1,
              ),
              child: Center(
                child: Image.asset(
                  'assets/png/sm_logo.png',
                  height: context.height * .2,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const LoginForms(),
            const RememberMe(),
          ],
        ),
      ),
    );
  }
}
