import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wareco_2/src/features/functionalities/functionalities.dart';

import 'vsr_complete_table.dart';

class VsrCompleteDetailsPage extends ConsumerWidget {
  const VsrCompleteDetailsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vsrNo = ModalRoute.of(context)!.settings.arguments as int;

    return FunctionalityPageScaffold(
      withSingleChildScrollView: false,
      enterPressed: () async {},
      clearPressed: () {},
      children: [
        BuildReadOnlyFieldWidget(
          title: 'VSR No.:',
          value: '$vsrNo',
        ),
        const SizedBox(height: 20),
        Expanded(
          child: Container(
            color: Theme.of(context).splashColor,
            child: const VsrCompleteTable(),
          ),
        ),
      ],
    );
  }
}
