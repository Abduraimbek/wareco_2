import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wareco_2/src/features/functionalities/functionalities.dart';
import 'package:wareco_2/src/helpers/extensions.dart';

import '../controllers/store_details_controller.dart';
import 'build_result.dart';

class StoreDetailsView extends ConsumerWidget {
  const StoreDetailsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FunctionalityPageScaffold(
      enterPressed: () async {
        await ref.read(storeDetailsControllerProvider.notifier).pressEnter();
      },
      clearPressed: () {
        ref.invalidate(storeDetailsControllerProvider);
      },
      children: [
        StoreAutoComplete(
          onStoreNoChanged: (p0) {
            ref.read(storeDetailsControllerProvider.notifier).changeStoreNo(p0);
          },
        ),
        Padding(
          padding: const EdgeInsets.only(top: 40, bottom: 10),
          child: Text('Result:', style: context.italicStyle),
        ),
        const BuildResult(),
      ],
    );
  }
}
