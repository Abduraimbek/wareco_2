import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wareco_2/src/features/functionalities/functionalities.dart';

part 'add_box_to_location_controller.g.dart';
part 'add_box_to_location_controller.freezed.dart';

@riverpod
class AddBoxToLocationController extends _$AddBoxToLocationController {
  @override
  AddBoxToLocationState build() {
    return const AddBoxToLocationState.initial();
  }

  String _scannedBarcode = '';

  void onBarcodeScanned(String barcode) {
    _scannedBarcode = barcode;
  }

  Future<void> okPressed() async {
    state = const AddBoxToLocationState.loading();

    final wifi = await ref.read(wifiStatusProvider.notifier).checkConnection();
    if (!wifi) {
      state = const AddBoxToLocationState.initial();
      return;
    }

    final location = ref.read(selectedLocationControllerProvider);
    final palletId = ref.read(selectedPalletIdControllerProvider);

    try {
      state = AddBoxToLocationState.success(
        boxBarcode: _scannedBarcode,
        location: location!.number.toString(),
        palletId: palletId!.number.toString(),
      );
    } catch (e) {
      state = AddBoxToLocationState.error(e.toString());
    }
  }
}

@freezed
class AddBoxToLocationState with _$AddBoxToLocationState {
  const factory AddBoxToLocationState.initial() = _Initial;

  const factory AddBoxToLocationState.error([
    @Default('Unknown Error') String message,
  ]) = _Error;

  const factory AddBoxToLocationState.loading([
    @Default('Loading...') String message,
  ]) = _Loading;

  const factory AddBoxToLocationState.success({
    required String boxBarcode,
    required String location,
    required String palletId,
  }) = _Success;
}
