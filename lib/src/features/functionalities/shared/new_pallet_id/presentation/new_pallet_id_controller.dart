import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wareco_2/src/features/functionalities/functionalities.dart';

import '../application/new_pallet_id_service.dart';

part 'new_pallet_id_controller.g.dart';

@riverpod
FutureOr<List<NewPalletIdModel>> newPalletIdsController(
    NewPalletIdsControllerRef ref) {
  return ref.read(newPalletIdServiceProvider).getNewPalletIds();
}

@riverpod
class SelectedNewPalletIdController extends _$SelectedNewPalletIdController {
  @override
  NewPalletIdModel? build() {
    return null;
  }

  void selectNewPalletId(NewPalletIdModel? newPalletIdModel) {
    state = newPalletIdModel;
  }
}
