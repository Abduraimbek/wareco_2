import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wareco_2/src/features/functionalities/functionalities.dart';

import 'build_store_name.dart';
import '../controllers/stock_take_controller.dart';

class StockTakeView extends ConsumerStatefulWidget {
  const StockTakeView({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _StockTakeState();
}

class _StockTakeState extends ConsumerState<StockTakeView> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(stockTakeControllerProvider);
    String data = '';
    state.when(
      initial: () => data = '',
      error: (message) => data = message,
      loading: (message) => data = message,
      success: (box, location, palletId) => data =
          'Box "$box" recorded in Location "$location" under Pallet ID $palletId".',
    );

    return FunctionalityPageScaffold(
      okPressed: () {
        if (locationKey.currentState!.validate() &&
            storeNoKey.currentState!.validate() &&
            palletIdKey.currentState!.validate() &&
            barcodeKey.currentState!.validate()) {
          ref.read(stockTakeControllerProvider.notifier).okPressed();
        }
      },
      resetPressed: () {
        ref.invalidate(stockTakeControllerProvider);
      },
      children: [
        Row(
          children: const [
            Expanded(child: LocationDropDown()),
            SizedBox(width: 60),
            Expanded(child: StoreNoDropDown()),
          ],
        ),
        const SizedBox(height: 20),
        const BuildStoreName(),
        const SizedBox(height: 20),
        const PalletIdDropDown(),
        const SizedBox(height: 20),
        BoxBarcodeListenerWidget(
          onBarcodeListened:
              ref.read(stockTakeControllerProvider.notifier).onBarcodeScanned,
        ),
        const SizedBox(height: 40),
        BuildResultWidget(data: data),
      ],
    );
  }
}
