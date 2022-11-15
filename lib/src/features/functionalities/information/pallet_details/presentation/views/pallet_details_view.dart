import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wareco_2/src/features/functionalities/functionalities.dart';
import 'package:wareco_2/src/helpers/extensions.dart';
import 'package:wareco_2/src/widgets/my_max_width_button.dart';

import '../controllers/pallet_details_controller.dart';
import 'build_result.dart';

class PalletDetailsView extends ConsumerWidget {
  const PalletDetailsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FunctionalityPageScaffold(
      withSingleChildScrollView: false,
      enterPressed: () async {
        await ref.read(palletDetailsControllerProvider.notifier).pressEnter();
      },
      clearPressed: () {
        ref
            .read(palletDetailsControllerProvider.notifier)
            .pressDetails(context);
      },
      children: [
        PalletListenerWidget(
          onPalletIdListened: (p0) {
            ref
                .read(palletDetailsControllerProvider.notifier)
                .onPalletIdChanged(p0);
          },
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 10),
          child: Text('Result:', style: context.italicStyle),
        ),
        const Expanded(
          child: BuildResult(),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.width * .25,
            vertical: 10,
          ),
          child: MyMaxWidthButton(
            onPressed: () {
              FocusManager.instance.primaryFocus?.unfocus();
              ref
                  .read(palletDetailsControllerProvider.notifier)
                  .pressDetails(context);
            },
            text: 'Details',
          ),
        ),
      ],
    );
  }
}
