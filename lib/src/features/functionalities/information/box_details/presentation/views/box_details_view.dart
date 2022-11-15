import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wareco_2/src/features/functionalities/functionalities.dart';

import '../controllers/box_details_controller.dart';
import 'build_result.dart';

class BoxDetailsView extends ConsumerWidget {
  const BoxDetailsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FunctionalityPageScaffold(
      withSingleChildScrollView: false,
      enterPressed: () async {
        await ref.read(boxDetailsControllerProvider.notifier).pressEnter();
      },
      clearPressed: () {
        ref.invalidate(boxDetailsControllerProvider);
      },
      children: [
        BoxBarcodeListenerWidget(
          onBarcodeListened: (p0) {
            ref
                .read(boxDetailsControllerProvider.notifier)
                .onBarcodeScanned(p0);
          },
        ),
        const SizedBox(height: 20),
        const BuildResult(),
      ],
    );
  }
}
