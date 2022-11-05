import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wareco_2/src/features/functionalities/functionalities.dart';

import '../../repository/barcode_scan_response.dart';

part 'remove_box_from_location_controller.g.dart';
part 'remove_box_from_location_controller.freezed.dart';

@riverpod
class RemoveBoxFromLocationController
    extends _$RemoveBoxFromLocationController {
  @override
  RemoveBoxFromLocationState build() {
    return const RemoveBoxFromLocationState.initial();
  }

  Future<void> okPressed({required BarcodeScanResponse response}) async {
    state = const RemoveBoxFromLocationState.loading();

    final wifi = await ref.read(wifiStatusProvider.notifier).checkConnection();
    if (!wifi) {
      state = const RemoveBoxFromLocationState.initial();
      return;
    }

    try {
      state = const RemoveBoxFromLocationState.success(
        box: 'box',
        location: 'location',
      );
    } catch (e) {
      state = RemoveBoxFromLocationState.error(e.toString());
    }
  }
}

@freezed
class RemoveBoxFromLocationState with _$RemoveBoxFromLocationState {
  const factory RemoveBoxFromLocationState.initial() = _Initial;

  const factory RemoveBoxFromLocationState.loading([
    @Default('Loading...') String message,
  ]) = _Loading;

  const factory RemoveBoxFromLocationState.error([
    @Default('Unknown Error') String message,
  ]) = _Error;

  const factory RemoveBoxFromLocationState.success({
    required String box,
    required String location,
  }) = _Success;
}
