import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wareco_2/src/features/home/home.dart';
import 'package:wareco_2/src/global/language/language_provider.dart';
import 'package:wareco_2/src/widgets/my_max_width_button.dart';

import 'build_item.dart';

class FunctionsPage extends ConsumerWidget {
  const FunctionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lan = ref.watch(languageProvider);
    final selectedMenu = ref.watch(selectedMenuProvider);
    final functionsList = ref.watch(functionsByMenuProvider);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(selectedMenu.text),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(12),
        child: MyMaxWidthButton(
          onPressed: () => Navigator.of(context).pop(),
          text: lan.back,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 10, bottom: 30),
        child: Column(
          children: [
            for (final e in functionsList)
              BuildItem(
                onPressed: () {
                  ref
                      .read(selectedFunctionProvider.notifier)
                      .onFunctionPressed(context, e);
                },
                title: e.text,
              ),
          ],
        ),
      ),
    );
  }
}
