import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wareco_2/src/features/functionalities/functionalities.dart';
import 'package:wareco_2/src/global/common_state.dart';

import '../../application/add_pallet_to_location_service.dart';
import '../../repository/add_pallet_to_location_response.dart';

part 'add_pallet_to_location_controller.g.dart';

@riverpod
class AddPalletToLocationController extends _$AddPalletToLocationController {
  @override
  CommonState<AddPalletToLocationResponse> build() {
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
        .read(addPalletToLocationServiceProvider)
        .getAddPalletToLocationResponse());
  }
}
