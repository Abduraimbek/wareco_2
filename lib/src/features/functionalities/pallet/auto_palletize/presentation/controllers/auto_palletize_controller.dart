import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wareco_2/src/features/functionalities/functionalities.dart';
import 'package:wareco_2/src/global/common_state.dart';

import '../../application/auto_palletize_service.dart';
import '../../repository/auto_palletize_reponse.dart';

part 'auto_palletize_controller.g.dart';

@riverpod
class AutoPalletizeController extends _$AutoPalletizeController {
  @override
  CommonState<AutoPalletizeResponse> build() {
    return const CommonState.initial();
  }

  Future<void> okPressed() async {
    state = const CommonState.loading();

    final wifi = await ref.read(wifiStatusProvider.notifier).checkConnection();
    if (!wifi) {
      state = const CommonState.initial();
      return;
    }

    final selectedLocation = ref.read(selectedLocationControllerProvider);
    final selectedStoreNo = ref.read(selectedStoreNoControllerProvider);
    final selectedPalledId = ref.read(selectedPalletIdControllerProvider);

    state = await CommonState.guard(() =>
        ref.read(autoPalletizeServiceProvider).getAutoPalletizeResponse());
  }
}
