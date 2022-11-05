import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wareco_2/src/features/functionalities/functionalities.dart';

part 'add_box_to_pallet_controller.freezed.dart';
part 'add_box_to_pallet_controller.g.dart';

@riverpod
class AddBoxToPalletController extends _$AddBoxToPalletController {
  @override
  AddBoxToPalletState build() {
    return const AddBoxToPalletState.initial();
  }

  String _scannedBarcode = '';

  void onBarcodeScanned(String barcode) {
    _scannedBarcode = barcode;
  }

  Future<void> okPressed() async {
    state = const AddBoxToPalletState.loading();

    final wifi = await ref.read(wifiStatusProvider.notifier).checkConnection();
    if (!wifi) {
      state = const AddBoxToPalletState.initial();
      return;
    }

    final storeNo = ref.read(selectedStoreNoControllerProvider);
    final palletId = ref.read(selectedPalletIdControllerProvider);

    try {
      state = AddBoxToPalletState.success(
        box: _scannedBarcode,
        pallet: palletId!.number.toString(),
      );
    } catch (e) {
      state = AddBoxToPalletState.error(e.toString());
    }
  }
}

@freezed
class AddBoxToPalletState with _$AddBoxToPalletState {
  const factory AddBoxToPalletState.initial() = _Initial;

  const factory AddBoxToPalletState.error([
    @Default('Unknown Error') String message,
  ]) = _Error;

  const factory AddBoxToPalletState.loading([
    @Default('Loading...') String message,
  ]) = _Loading;

  const factory AddBoxToPalletState.success({
    required String box,
    required String pallet,
  }) = _Success;
}
