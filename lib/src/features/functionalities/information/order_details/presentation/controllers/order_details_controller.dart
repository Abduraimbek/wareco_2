import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wareco_2/src/features/functionalities/functionalities.dart';
import 'package:wareco_2/src/global/common_state.dart';

import '../../application/order_details_service.dart';
import '../../repository/order_details_response.dart';

part 'order_details_controller.g.dart';

@riverpod
class OrderDetailsController extends _$OrderDetailsController {
  @override
  CommonState<OrderDetailsResponse> build() {
    return const CommonState.initial();
  }

  int storeNo = 0;
  int poDrNo = 0;
  int vendor = 0;

  void changeStoreNo(int storeNo) {
    this.storeNo = storeNo;
  }

  void changePoDrNo(int poDrNo) {
    this.poDrNo = poDrNo;
  }

  void changeVendor(int vendor) {
    this.vendor = vendor;
  }

  Future<void> pressEnter() async {
    if (storeNo == 0) {
      state = const CommonState.error('Enter Store No.');
      return;
    }
    if (poDrNo == 0) {
      state = const CommonState.error('Enter PO/DR No.');
      return;
    }
    if (vendor == 0) {
      state = const CommonState.error('Enter vendor.');
      return;
    }

    state = const CommonState.loading();

    final wifi = await ref.read(wifiStatusProvider.notifier).checkConnection();
    if (!wifi) {
      state = const CommonState.initial();
      return;
    }

    state = await CommonState.guard(
        () => ref.read(orderDetailsServiceProvider).getOrderDetailsResponse());
  }
}
