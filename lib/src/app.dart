import 'package:flutter/material.dart';
import 'package:wareco_2/src/features/home/home.dart';
import 'package:wareco_2/src/features/login/login.dart';
import 'package:wareco_2/src/theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getMyTheme(),
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: const ScrollBehavior().copyWith(
            physics: const BouncingScrollPhysics(),
          ),
          child: _UnFocus(child: child!),
        );
      },
      initialRoute: functionalityPage,
      routes: <String, WidgetBuilder>{
        loginPage: (_) => const LoginPage(),
        homePage: (_) => const HomePage(),
        functionsPage: (_) => const FunctionsPage(),
        functionalityPage: (_) => const FunctionalityPage(),
      },
    );
  }

  static const loginPage = '/login-page';
  static const homePage = '/home-page';
  static const functionsPage = '/functions-page';
  static const functionalityPage = '/functionality-page';
}

class _UnFocus extends StatelessWidget {
  const _UnFocus({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: child,
    );
  }
}
