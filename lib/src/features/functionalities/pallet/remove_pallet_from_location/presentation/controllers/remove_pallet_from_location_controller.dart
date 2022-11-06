import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wareco_2/src/features/functionalities/functionalities.dart';
import 'package:wareco_2/src/global/common_state.dart';

import '../../application/remove_pallet_from_location_service.dart';
import '../../repository/remove_pallet_from_location_response.dart';

part 'remove_pallet_from_location_controller.g.dart';

@riverpod
class RemovePalletFromLocationController
    extends _$RemovePalletFromLocationController {
  @override
  CommonState<RemovePalletFromLocationResponse> build() {
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
    final selectedPalletId = ref.read(selectedPalletIdControllerProvider);

    state = await CommonState.guard(() => ref
        .read(removePalletFromLocationServiceProvider)
        .getRemovePalletFromLocationResponse());
  }
}
