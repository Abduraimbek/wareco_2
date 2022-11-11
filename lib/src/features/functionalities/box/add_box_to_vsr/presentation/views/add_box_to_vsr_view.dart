import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wareco_2/src/features/functionalities/functionalities.dart';

import '../controllers/add_box_to_vsr_controller.dart';

class AddBoxToVsrView extends ConsumerWidget {
  const AddBoxToVsrView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(addBoxToVsrControllerProvider);
    String data = '';
    state.when(
      error: (message) => data = message,
      loading: (message) => data = message,
      initial: () => data = '',
      success: (box, vsr) => data = 'Box "$box" added to VSR "$vsr".',
    );

    return FunctionalityPageScaffold(
      okPressed: () async {
        if (storeNoKey.currentState!.validate() &&
            vsrNoKey.currentState!.validate() &&
            barcodeKey.currentState!.validate() &&
            dimensionsAndWeightKey.currentState!.validate()) {
          await ref.read(addBoxToVsrControllerProvider.notifier).okPressed();
        }
      },
      resetPressed: () {
        ref.invalidate(addBoxToVsrControllerProvider);
      },
      children: [
        Row(
          children: const [
            Expanded(child: StoreNoDropDown()),
            SizedBox(width: 20),
            Expanded(child: VsrNoDropDown()),
          ],
        ),
        const SizedBox(height: 20),
        BoxBarcodeListenerWidget(
          onBarcodeListened: (value) {
            ref
                .read(addBoxToVsrControllerProvider.notifier)
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
