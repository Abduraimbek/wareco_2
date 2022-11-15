import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wareco_2/src/features/functionalities/functionalities.dart';
import 'package:wareco_2/src/helpers/extensions.dart';
import 'package:wareco_2/src/widgets/my_max_width_button.dart';

import '../controllers/vsr_details_controller.dart';
import 'build_vsr_result.dart';

class VsrDetailsView extends ConsumerWidget {
  const VsrDetailsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FunctionalityPageScaffold(
      withSingleChildScrollView: false,
      enterPressed: () async {
        await ref.read(vsrDetailsControllerProvider.notifier).pressEnter();
      },
      clearPressed: () {
        ref.invalidate(vsrDetailsControllerProvider);
      },
      children: [
        BuildIntField(
          label: 'VSR No.:',
          onChanged: (p0) {
            ref.read(vsrDetailsControllerProvider.notifier).changeVsrNo(p0);
          },
        ),
        const SizedBox(height: 20),
        Text('Result:', style: context.italicStyle),
        const SizedBox(height: 10),
        const Expanded(
          child: BuildVsrResult(),
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
                  .read(vsrDetailsControllerProvider.notifier)
                  .pressDetails(context);
            },
            text: 'Details',
          ),
        ),
      ],
    );
  }
}
