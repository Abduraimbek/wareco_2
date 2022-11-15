import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wareco_2/src/app.dart';
import 'package:wareco_2/src/features/functionalities/functionalities.dart';
import 'package:wareco_2/src/global/common_state.dart';
import 'package:wareco_2/src/helpers/extensions.dart';

import '../../application/pallet_details_service.dart';
import '../../repository/pallet_details_response.dart';

part 'pallet_details_controller.g.dart';

@riverpod
class PalletDetailsController extends _$PalletDetailsController {
  @override
  CommonState<PalletDetailsResponse> build() {
    return const CommonState.initial();
  }

  String palletId = '';

  void onPalletIdChanged(String palletId) {
    this.palletId = palletId;
  }

  Future<void> pressEnter() async {
    if (palletId == '') {
      state = const CommonState.error('Scan Pallet ID.');
      return;
    }

    state = const CommonState.loading();

    final wifi = await ref.read(wifiStatusProvider.notifier).checkConnection();
    if (!wifi) {
      state = const CommonState.initial();
      return;
    }

    state = await CommonState.guard(
        () => ref.read(palletDetailsServiceProvider).getPalletDetails());
  }

  void pressDetails(BuildContext context) {
    if (palletId == '') {
      context.showSnackBar('Scan Pallet ID');
    } else {
      Navigator.of(context).pushNamed(
        App.palletCompleteDetailsPage,
        arguments: palletId,
      );
    }
  }
}
