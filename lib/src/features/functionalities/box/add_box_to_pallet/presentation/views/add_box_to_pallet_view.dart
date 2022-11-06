import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wareco_2/src/features/functionalities/functionalities.dart';

import '../controllers/add_box_to_pallet_controller.dart';

class AddBoxToPalletView extends ConsumerWidget {
  const AddBoxToPalletView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(addBoxToPalletControllerProvider);
    String data = '';
    state.when(
      error: (message) => data = message,
      loading: (message) => data = message,
      initial: () => data = '',
      success: (box, pallet) => data = 'Box "$box" added to Pallet "$pallet".',
    );

    return FunctionalityPageScaffold(
      okPressed: () async {
        if (storeNoKey.currentState!.validate() &&
            palletIdKey.currentState!.validate() &&
            barcodeKey.currentState!.validate() &&
            dimensionsAndWeightKey.currentState!.validate()) {
          await ref.read(addBoxToPalletControllerProvider.notifier).okPressed();
        }
      },
      resetPressed: () {
        ref.invalidate(addBoxToPalletControllerProvider);
      },
      children: [
        Row(
          children: const [
            Expanded(
              flex: 2,
              child: StoreNoDropDown(),
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
                .read(addBoxToPalletControllerProvider.notifier)
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
