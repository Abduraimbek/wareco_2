import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wareco_2/src/features/functionalities/functionalities.dart';
import 'package:wareco_2/src/global/common_state.dart';

import '../../application/reopen_pallet_service.dart';
import '../../repository/reopen_pallet_response.dart';

part 'reopen_pallet_controller.g.dart';

@riverpod
class ReopenPalletController extends _$ReopenPalletController {
  @override
  CommonState<ReopenPalletResponse> build() {
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

    state = await CommonState.guard(
        () => ref.read(reopenPalletServiceProvider).getReopenPalletResponse());
  }
}
