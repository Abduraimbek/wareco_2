import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wareco_2/src/app.dart';
import 'package:wareco_2/src/global/language/language_provider.dart';
import 'package:wareco_2/src/features/home/home.dart';
import 'package:wareco_2/src/widgets/exit_dialog.dart';

import 'build_item.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lan = ref.watch(languageProvider);

    return WillPopScope(
      onWillPop: () async {
        final result = await showMyExitAppDialog(context);
        return result == true;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(lan.appName.toUpperCase()),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(App.loginPage);
              },
              icon: const Icon(Icons.logout_rounded, color: Colors.white),
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 10, bottom: 30),
          child: Column(
            children: [
              for (final e in Menus.values)
                BuildItem(
                  onPressed: () {
                    ref
                        .read(selectedMenuProvider.notifier)
                        .onMenuPressed(context, e);
                  },
                  title: e.text,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
