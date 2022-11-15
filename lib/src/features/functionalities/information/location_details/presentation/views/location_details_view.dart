import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wareco_2/src/features/functionalities/functionalities.dart';
import 'package:wareco_2/src/helpers/extensions.dart';
import 'package:wareco_2/src/widgets/my_max_width_button.dart';

import '../controllers/location_details_controller.dart';
import 'build_details_result.dart';

class LocationDetailsView extends ConsumerWidget {
  const LocationDetailsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FunctionalityPageScaffold(
      withSingleChildScrollView: false,
      enterPressed: () async {
        await ref.read(locationDetailsControllerProvider.notifier).pressEnter();
      },
      clearPressed: () {
        ref.invalidate(locationDetailsControllerProvider);
      },
      children: [
        LocationAutoComplete(
          onLocationChanged: (p0) {
            ref
                .read(locationDetailsControllerProvider.notifier)
                .changeLocation(p0);
          },
        ),
        const SizedBox(height: 20),
        Text('Result:', style: context.italicStyle),
        const SizedBox(height: 10),
        const Expanded(
          child: BuildDetailsResult(),
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
                  .read(locationDetailsControllerProvider.notifier)
                  .pressDetails(context);
            },
            text: 'Details',
          ),
        ),
      ],
    );
  }
}
