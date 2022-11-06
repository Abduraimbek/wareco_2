import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wareco_2/src/features/functionalities/functionalities.dart';

import '../controllers/remove_pallet_from_location_controller.dart';

class RemovePalletFromLocationView extends ConsumerWidget {
  const RemovePalletFromLocationView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FunctionalityPageScaffold(
      okPressed: () async {
        if (locationKey.currentState!.validate() &&
            storeNoKey.currentState!.validate() &&
            palletIdKey.currentState!.validate()) {
          await ref
              .read(removePalletFromLocationControllerProvider.notifier)
              .okPressed();
        }
      },
      resetPressed: () {
        ref.invalidate(removePalletFromLocationControllerProvider);
      },
      children: [
        Row(
          children: const [
            LocationDropDown(),
            SizedBox(width: 50),
            StoreNoDropDown(),
          ],
        ),
        const SizedBox(height: 20),
        const BuildStoreNameWidget(),
        const PalletIdDropDown(),
        const SizedBox(height: 50),
        Consumer(
          builder: (context, ref, child) {
            final state = ref.watch(removePalletFromLocationControllerProvider);
            String data = '';
            state.when(
              initial: () => data = '',
              loading: (message) => data = message,
              error: (message) => data = message,
              data: (d) => data =
                  'Pallet "${d.pallet}" removed from Location "${d.location}".',
            );

            return BuildResultWidget(data: data);
          },
        ),
      ],
    );
  }
}
