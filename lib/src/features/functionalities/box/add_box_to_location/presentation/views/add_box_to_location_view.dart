import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wareco_2/src/features/functionalities/functionalities.dart';

import '../controller/add_box_to_location_controller.dart';

class AddBoxToLocationView extends ConsumerWidget {
  const AddBoxToLocationView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(addBoxToLocationControllerProvider);
    String data = '';
    state.when(
      error: (message) => data = message,
      loading: (message) => data = message,
      initial: () => data = '',
      success: (boxBarcode, location, palletId) => data =
          'Box "$boxBarcode" added to Location "$location" under Pallet ID "$palletId"',
    );

    return FunctionalityPageScaffold(
      okPressed: () {
        if (locationKey.currentState!.validate() &&
            palletIdKey.currentState!.validate() &&
            barcodeKey.currentState!.validate() &&
            dimensionsAndWeightKey.currentState!.validate()) {
          ref.read(addBoxToLocationControllerProvider.notifier).okPressed();
        }
      },
      resetPressed: () {},
      children: [
        Row(
          children: const [
            Expanded(
              flex: 2,
              child: LocationDropDown(),
            ),
            SizedBox(width: 20),
            Expanded(
              flex: 3,
              child: PalletIdDropDown(),
            ),
          ],
        ),
        const SizedBox(height: 20),
        BoxBarcodeListenerWidget(
          onBarcodeListened: (value) {
            ref
                .read(addBoxToLocationControllerProvider.notifier)
                .onBarcodeScanned(value);
          },
        ),
        const SizedBox(height: 20),
        const DimensionsAndWeight(),
        const SizedBox(height: 20),
        BuildResultWidget(data: data),
      ],
    );
  }
}
