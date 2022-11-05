import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wareco_2/src/features/functionalities/functionalities.dart';

part 'stock_take_controller.g.dart';
part 'stock_take_controller.freezed.dart';

@riverpod
class StockTakeController extends _$StockTakeController {
  @override
  StockTakeState build() {
    return const StockTakeState.initial();
  }

  String _scannedBarcode = '';

  void onBarcodeScanned(String barcode) {
    _scannedBarcode = barcode;
  }

  Future<void> okPressed() async {
    state = const StockTakeState.loading();

    final wifi = await ref.read(wifiStatusProvider.notifier).checkConnection();
    if (!wifi) {
      state = const StockTakeState.initial();
      return;
    }

    final location = ref.read(selectedLocationControllerProvider);
    final storeNo = ref.read(selectedStoreNoControllerProvider);
    final palletId = ref.read(selectedPalletIdControllerProvider);

    try {
      state = StockTakeState.success(
        box: _scannedBarcode,
        location: location!.number.toString(),
        palletId: palletId!.number.toString(),
      );
    } catch (e) {
      state = StockTakeState.error(e.toString());
    }
  }
}

@freezed
class StockTakeState with _$StockTakeState {
  const factory StockTakeState.initial() = _Initial;

  const factory StockTakeState.loading([
    @Default('Loading...') String message,
  ]) = _Loading;

  const factory StockTakeState.error([
    @Default('Unknonw Error') String message,
  ]) = _Error;

  const factory StockTakeState.success({
    required String box,
    required String location,
    required String palletId,
  }) = _Success;
}
