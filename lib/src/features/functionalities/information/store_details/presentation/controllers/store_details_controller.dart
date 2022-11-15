import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wareco_2/src/features/functionalities/functionalities.dart';
import 'package:wareco_2/src/global/common_state.dart';

import '../../application/store_details_service.dart';
import '../../repository/store_details_response.dart';

part 'store_details_controller.g.dart';

@riverpod
class StoreDetailsController extends _$StoreDetailsController {
  @override
  CommonState<StoreDetailsResponse> build() {
    return const CommonState.initial();
  }

  int storeNo = 0;

  void changeStoreNo(int storeNo) {
    this.storeNo = storeNo;
  }

  Future<void> pressEnter() async {
    if (storeNo == 0) {
      state = const CommonState.error('Enter Store No.');
      return;
    }

    state = const CommonState.loading();

    final wifi = await ref.read(wifiStatusProvider.notifier).checkConnection();
    if (!wifi) {
      state = const CommonState.initial();
      return;
    }

    state = await CommonState.guard(
        () => ref.read(storeDetailsServiceProvider).getStoreDetailsResponse());
  }
}
