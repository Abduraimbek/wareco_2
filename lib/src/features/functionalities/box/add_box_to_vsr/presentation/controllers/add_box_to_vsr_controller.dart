import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wareco_2/src/features/functionalities/functionalities.dart';

part 'add_box_to_vsr_controller.g.dart';
part 'add_box_to_vsr_controller.freezed.dart';

@riverpod
class AddBoxToVsrController extends _$AddBoxToVsrController {
  @override
  AddBoxToVsrState build() {
    return const AddBoxToVsrState.initial();
  }

  String _scannedBarcode = '';

  void onBarcodeScanned(String barcode) {
    _scannedBarcode = barcode;
  }

  Future<void> okPressed() async {
    state = const AddBoxToVsrState.loading();

    final wifi = await ref.read(wifiStatusProvider.notifier).checkConnection();
    if (!wifi) {
      state = const AddBoxToVsrState.initial();
      return;
    }

    final storeNo = ref.read(selectedStoreNoControllerProvider);
    final vsrNo = ref.read(selectedVsrNoControllerProvider);

    try {
      state = AddBoxToVsrState.success(
        box: _scannedBarcode,
        vsr: vsrNo!.number.toString(),
      );
    } catch (e) {
      state = AddBoxToVsrState.error(e.toString());
    }
  }
}

@freezed
class AddBoxToVsrState with _$AddBoxToVsrState {
  const factory AddBoxToVsrState.initial() = _Initial;

  const factory AddBoxToVsrState.error([
    @Default('Unknow Error') String message,
  ]) = _Error;

  const factory AddBoxToVsrState.loading([
    @Default('Loading...') String message,
  ]) = _Loading;

  const factory AddBoxToVsrState.success({
    required String box,
    required String vsr,
  }) = _Success;
}
