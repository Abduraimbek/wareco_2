import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wareco_2/src/features/functionalities/functionalities.dart';

import '../application/pallet_id_service.dart';

part 'pallet_id_controller.g.dart';

@riverpod
FutureOr<List<PalletIdModel>> palletIdsController(PalletIdsControllerRef ref) {
  return ref.read(palletIdServiceProvider).getPalletIds();
}

@riverpod
class SelectedPalletIdController extends _$SelectedPalletIdController {
  @override
  PalletIdModel? build() {
    return null;
  }

  void selectPalletId(PalletIdModel? palletIdModel) {
    state = palletIdModel;
  }
}
