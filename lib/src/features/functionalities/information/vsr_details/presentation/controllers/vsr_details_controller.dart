import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wareco_2/src/app.dart';
import 'package:wareco_2/src/features/functionalities/functionalities.dart';
import 'package:wareco_2/src/global/common_state.dart';
import 'package:wareco_2/src/helpers/extensions.dart';

import '../../application/vsr_details_service.dart';
import '../../repository/vsr_details_response.dart';

part 'vsr_details_controller.g.dart';

@riverpod
class VsrDetailsController extends _$VsrDetailsController {
  @override
  CommonState<VsrDetailsResponse> build() {
    return const CommonState.initial();
  }

  int vsrNo = 0;

  void changeVsrNo(int vsrNo) {
    this.vsrNo = vsrNo;
  }

  Future<void> pressEnter() async {
    if (vsrNo == 0) {
      state = const CommonState.error('Select VSR No.');
      return;
    }

    state = const CommonState.loading();

    final wifi = await ref.read(wifiStatusProvider.notifier).checkConnection();
    if (!wifi) {
      state = const CommonState.initial();
      return;
    }

    state = await CommonState.guard(
        () => ref.read(vsrDetailsServiceProvider).getVsrDetails());
  }

  void pressDetails(BuildContext context) {
    if (vsrNo == 0) {
      context.showSnackBar('Select VSR No.');
    } else {
      Navigator.of(context).pushNamed(
        App.vsrCompleteDetailsPage,
        arguments: vsrNo,
      );
    }
  }
}
