import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wareco_2/src/features/functionalities/functionalities.dart';
import 'package:wareco_2/src/global/common_state.dart';

import '../../application/box_details_service.dart';
import '../../repository/box_details_response.dart';

part 'box_details_controller.g.dart';

@riverpod
class BoxDetailsController extends _$BoxDetailsController {
  @override
  CommonState<BoxDetailsResponse> build() {
    return const CommonState.initial();
  }

  String _barcode = '';

  void onBarcodeScanned(String barcode) {
    _barcode = barcode;
  }

  Future<void> pressEnter() async {
    if (_barcode == '') {
      state = const CommonState.error('Scan Barcode.');
      return;
    }

    state = const CommonState.loading();

    final wifi = await ref.read(wifiStatusProvider.notifier).checkConnection();
    if (!wifi) {
      state = const CommonState.initial();
      return;
    }

    state = await CommonState.guard(
        () => ref.read(boxDetailsServiceProvider).getBoxDetailsResponse());
  }
}
