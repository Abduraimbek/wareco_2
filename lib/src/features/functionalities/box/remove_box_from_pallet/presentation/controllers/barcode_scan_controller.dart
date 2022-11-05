import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wareco_2/src/features/functionalities/functionalities.dart';

import '../../application/remove_box_from_pallet_service.dart';
import '../../repository/barcode_scan_response.dart';

part 'barcode_scan_controller.g.dart';
part 'barcode_scan_controller.freezed.dart';

@riverpod
class BarcodeScanController extends _$BarcodeScanController {
  @override
  BarcodeScanState build() {
    return const BarcodeScanState.initial();
  }

  Future<void> onBarcodeScanned(String barcode) async {
    if (barcode.isEmpty) {
      state = const BarcodeScanState.initial();
      return;
    }

    state = const BarcodeScanState.loading();

    final wifi = await ref.read(wifiStatusProvider.notifier).checkConnection();
    if (!wifi) {
      state = const BarcodeScanState.initial();
      return;
    }

    try {
      final response = await ref
          .read(removeBoxFromPalletServiceProvider)
          .getBarcodeScanResponse(barcode: barcode);
      state = BarcodeScanState.success(barcodeScanResponse: response);
    } catch (e) {
      state = BarcodeScanState.error(e.toString());
    }
  }
}

@freezed
class BarcodeScanState with _$BarcodeScanState {
  const factory BarcodeScanState.initial() = _Initial;

  const factory BarcodeScanState.loading() = _Loading;

  const factory BarcodeScanState.error([
    @Default('Unknown Error') String message,
  ]) = _Error;

  const factory BarcodeScanState.success({
    required BarcodeScanResponse barcodeScanResponse,
  }) = _Success;
}
