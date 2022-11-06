import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wareco_2/src/features/functionalities/functionalities.dart';
import 'package:wareco_2/src/helpers/extensions.dart';

import '../controllers/barcode_scan_controller.dart';
import '../controllers/remove_box_from_pallet_controller.dart';
import '../../repository/barcode_scan_response.dart';

class RemoveBoxFromPalletView extends ConsumerWidget {
  const RemoveBoxFromPalletView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final barcodeScanState = ref.watch(barcodeScanControllerProvider);
    final state = ref.watch(removeBoxFromPalletControllerProvider);

    BarcodeScanResponse? response;
    barcodeScanState.when(
      initial: () {},
      loading: () {},
      error: (message) {},
      success: (barcodeScanResponse) => response = barcodeScanResponse,
    );

    String data = '';
    state.when(
      initial: () => data = '',
      error: (message) => data = message,
      loading: (message) => data = message,
      success: (box, pallet) =>
          data = 'Box "$box" removed from Pallet "$pallet".',
    );

    return FunctionalityPageScaffold(
      okPressed: () async {
        if (response != null) {
          await ref
              .read(removeBoxFromPalletControllerProvider.notifier)
              .okPressed(response: response!);
        } else {
          context.showSnackBar('Barcode not scanned yet.');
        }
      },
      resetPressed: () {
        ref.invalidate(barcodeScanControllerProvider);
        ref.invalidate(removeBoxFromPalletControllerProvider);
      },
      children: [
        BoxBarcodeListenerWidget(
          onBarcodeListened:
              ref.read(barcodeScanControllerProvider.notifier).onBarcodeScanned,
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: BuildReadOnlyFieldWidget(
                title: 'Pallet ID:',
                value: response?.palletId ?? '',
              ),
            ),
            const SizedBox(width: 50),
            Expanded(
              child: BuildReadOnlyFieldWidget(
                title: 'Store No.:',
                value: response?.storeNo ?? '',
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        BuildReadOnlyFieldWidget(
          title: 'Store Name:',
          value: response?.storeName ?? '',
        ),
        const SizedBox(height: 100),
        BuildResultWidget(data: data),
      ],
    );
  }
}
