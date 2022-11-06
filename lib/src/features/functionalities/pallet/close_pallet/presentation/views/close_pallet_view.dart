import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wareco_2/src/features/functionalities/functionalities.dart';
import 'package:wareco_2/src/features/functionalities/shared/build_check_box_widget.dart';

import '../controllers/close_pallet_controller.dart';

class ClosePalletView extends ConsumerWidget {
  const ClosePalletView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FunctionalityPageScaffold(
      okPressed: () async {
        if (storeNoKey.currentState!.validate() &&
            palletIdKey.currentState!.validate() &&
            barcodeKey.currentState!.validate() &&
            newPalletIdKey.currentState!.validate()) {
          await ref.read(closePalletControllerProvider.notifier).okPressed();
        }
      },
      resetPressed: () {
        ref.invalidate(closePalletControllerProvider);
        ref.invalidate(closeByLastScannedBoxProvider);
      },
      children: [
        Row(
          children: const [
            Expanded(child: StoreNoDropDown()),
            SizedBox(width: 50),
            Expanded(child: PalletIdDropDown()),
          ],
        ),
        const SizedBox(height: 20),
        const BuildStoreNameWidget(),
        Consumer(
          builder: (context, ref, _) {
            return BuildCheckBoxWidget(
              title: 'Close By Last Scanned Box',
              checked: ref.watch(closeByLastScannedBoxProvider),
              onChanged:
                  ref.read(closeByLastScannedBoxProvider.notifier).changeState,
            );
          },
        ),
        const SizedBox(height: 10),
        BoxBarcodeListenerWidget(
          onBarcodeListened:
              ref.read(closePalletControllerProvider.notifier).onBarcodeScanned,
        ),
        const SizedBox(height: 20),
        const NewPalletIdDropDown(),
        const SizedBox(height: 50),
        Consumer(
          builder: (context, ref, _) {
            final state = ref.watch(closePalletControllerProvider);
            String data = '';
            state.when(
              initial: () => data = '',
              loading: (message) => data = message,
              error: (message) => data = message,
              data: (d) =>
                  data = 'Pallet "${d.pallet}" closed by last scanned Box',
            );

            return BuildResultWidget(data: data);
          },
        ),
      ],
    );
  }
}
