import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wareco_2/src/features/functionalities/functionalities.dart';

import 'pallet_complete_table.dart';

class PalletCompleteDetailsPage extends ConsumerWidget {
  const PalletCompleteDetailsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palletId = ModalRoute.of(context)!.settings.arguments as String;

    return FunctionalityPageScaffold(
      withSingleChildScrollView: false,
      enterPressed: () async {},
      clearPressed: () {},
      children: [
        BuildReadOnlyFieldWidget(
          title: 'Pallet ID:',
          value: palletId,
        ),
        const SizedBox(height: 20),
        Expanded(
          child: Container(
            color: Theme.of(context).splashColor,
            child: const PalletCompleteTable(),
          ),
        ),
      ],
    );
  }
}
