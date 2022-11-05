import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wareco_2/src/features/functionalities/functionalities.dart';

import '../../repository/barcode_scan_response.dart';

part 'remove_box_from_vsr_controller.g.dart';
part 'remove_box_from_vsr_controller.freezed.dart';

@riverpod
class RemoveBoxFromVsrController extends _$RemoveBoxFromVsrController {
  @override
  RemoveBoxFromVsrState build() {
    return const RemoveBoxFromVsrState.initial();
  }

  Future<void> okPressed({required BarcodeScanResponse response}) async {
    state = const RemoveBoxFromVsrState.loading();

    final wifi = await ref.read(wifiStatusProvider.notifier).checkConnection();
    if (!wifi) {
      state = const RemoveBoxFromVsrState.initial();
      return;
    }

    try {
      state = const RemoveBoxFromVsrState.success(
        box: 'box',
        vsr: 'vsr',
      );
    } catch (e) {
      state = RemoveBoxFromVsrState.error(e.toString());
    }
  }
}

@freezed
class RemoveBoxFromVsrState with _$RemoveBoxFromVsrState {
  const factory RemoveBoxFromVsrState.initial() = _Initial;

  const factory RemoveBoxFromVsrState.loading([
    @Default('Loading...') String message,
  ]) = _Loading;

  const factory RemoveBoxFromVsrState.error([
    @Default('Unknown Error') String message,
  ]) = _Error;

  const factory RemoveBoxFromVsrState.success({
    required String box,
    required String vsr,
  }) = _Success;
}
