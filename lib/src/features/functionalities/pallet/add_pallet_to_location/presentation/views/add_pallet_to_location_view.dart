import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wareco_2/src/features/functionalities/functionalities.dart';

import '../controllers/add_pallet_to_location_controller.dart';

class AddPalletToLocationView extends ConsumerWidget {
  const AddPalletToLocationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FunctionalityPageScaffold(
      okPressed: () async {
        if (locationKey.currentState!.validate() &&
            storeNoKey.currentState!.validate() &&
            palletIdKey.currentState!.validate()) {
          await ref
              .read(addPalletToLocationControllerProvider.notifier)
              .okPressed();
        }
      },
      resetPressed: () {
        ref.invalidate(addPalletToLocationControllerProvider);
      },
      children: [
        Row(
          children: const [
            Expanded(child: LocationDropDown()),
            SizedBox(width: 50),
            Expanded(child: StoreNoDropDown()),
          ],
        ),
        const SizedBox(height: 20),
        const BuildStoreNameWidget(),
        const SizedBox(height: 20),
        const PalletIdDropDown(),
        const SizedBox(height: 50),
        Consumer(
          builder: (context, ref, _) {
            final state = ref.watch(addPalletToLocationControllerProvider);
            String data = '';
            state.when(
              initial: () => data = '',
              loading: (message) => data = message,
              error: (message) => data = message,
              data: (d) => data =
                  'Pallet "${d.pallet}" added to Location "${d.location}".',
            );

            return BuildResultWidget(data: data);
          },
        ),
      ],
    );
  }
}
