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
    final categories = ref.watch(functionCategoriesProvider);

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
              icon: const Icon(Icons.logout_rounded),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              for (final e in categories)
                BuildItem(
                  onPressed: () {
                    ref
                        .read(homeProvider.notifier)
                        .onCategoryPressed(context, e);
                  },
                  title: e.titleEN,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
