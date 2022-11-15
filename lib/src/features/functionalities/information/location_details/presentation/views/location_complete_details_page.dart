import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wareco_2/src/features/functionalities/functionalities.dart';

import 'location_complete_table.dart';

class LocationCompleteDetailsPage extends ConsumerWidget {
  const LocationCompleteDetailsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final location = ModalRoute.of(context)!.settings.arguments as int;

    return FunctionalityPageScaffold(
      withSingleChildScrollView: false,
      enterPressed: () async {},
      clearPressed: () {},
      children: [
        BuildReadOnlyFieldWidget(
          title: 'Location',
          value: '$location',
        ),
        const SizedBox(height: 20),
        Expanded(
          child: Container(
            color: Theme.of(context).splashColor,
            child: const LocationCompleteTable(),
          ),
        ),
      ],
    );
  }
}
