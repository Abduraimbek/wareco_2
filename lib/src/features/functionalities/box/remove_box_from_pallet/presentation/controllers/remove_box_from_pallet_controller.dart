import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../repository/barcode_scan_response.dart';

part 'remove_box_from_pallet_controller.g.dart';
part 'remove_box_from_pallet_controller.freezed.dart';

@riverpod
class RemoveBoxFromPalletController extends _$RemoveBoxFromPalletController {
  @override
  RemoveBoxFromPalletState build() {
    return const RemoveBoxFromPalletState.initial();
  }

  Future<void> okPressed({required BarcodeScanResponse response}) async {
    state = const RemoveBoxFromPalletState.loading();
  }
}

@freezed
class RemoveBoxFromPalletState with _$RemoveBoxFromPalletState {
  const factory RemoveBoxFromPalletState.initial() = _Initial;

  const factory RemoveBoxFromPalletState.loading([
    @Default('Loading...') String message,
  ]) = _Loading;

  const factory RemoveBoxFromPalletState.error([
    @Default('Unknown Error') String message,
  ]) = _Error;

  const factory RemoveBoxFromPalletState.success({
    required String box,
    required String pallet,
  }) = _Success;
}
