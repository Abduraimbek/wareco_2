import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wareco_2/src/features/functionalities/functionalities.dart';
import 'package:wareco_2/src/global/common_state.dart';

import '../../application/close_pallet_service.dart';
import '../../repository/close_pallet_response.dart';

part 'close_pallet_controller.g.dart';

@riverpod
class CloseByLastScannedBox extends _$CloseByLastScannedBox {
  @override
  bool build() {
    return false;
  }

  void changeState() {
    state = !state;
  }
}

@riverpod
class ClosePalletController extends _$ClosePalletController {
  @override
  CommonState<ClosePalletResponse> build() {
    return const CommonState.initial();
  }

  String _scannedBarcode = '';

  void onBarcodeScanned(String barcode) {
    _scannedBarcode = barcode;
  }

  Future<void> okPressed() async {
    state = const CommonState.loading();

    final wifi = await ref.read(wifiStatusProvider.notifier).checkConnection();
    if (!wifi) {
      state = const CommonState.initial();
      return;
    }

    final selectedStoreNo = ref.read(selectedStoreNoControllerProvider);
    final selectedPalletId = ref.read(selectedPalletIdControllerProvider);
    final closeByLastScannedBox = ref.read(closeByLastScannedBoxProvider);
    final selectedNewPalletId =
        ref.watch(selectedNewPalletIdControllerProvider);

    state = await CommonState.guard(
        () => ref.read(closePalletServiceProvider).getClosePalletResponse());
  }
}
