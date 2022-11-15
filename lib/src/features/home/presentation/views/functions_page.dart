import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wareco_2/src/features/home/home.dart';

import 'build_item.dart';

class FunctionsPage extends ConsumerWidget {
  const FunctionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedMenu = ref.watch(selectedMenuProvider);
    final functionsList = ref.watch(functionsByMenuProvider);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(selectedMenu.text),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(top: 15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
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
          ),
          BuildItem(
            onPressed: () {
              Navigator.of(context).pop();
            },
            title: 'BACK',
          ),
          const SafeArea(
            child: SizedBox(height: 25),
          ),
        ],
      ),
    );
  }
}
