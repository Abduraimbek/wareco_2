import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wareco_2/src/app.dart';
import 'package:wareco_2/src/features/functionalities/functionalities.dart';
import 'package:wareco_2/src/global/common_state.dart';
import 'package:wareco_2/src/helpers/extensions.dart';

import '../../repository/location_details_response.dart';
import '../../application/location_details_service.dart';

part 'location_details_controller.g.dart';

@riverpod
class LocationDetailsController extends _$LocationDetailsController {
  @override
  CommonState<LocationDetailsResponse> build() {
    return const CommonState.initial();
  }

  int location = 0;

  void changeLocation(int location) {
    this.location = location;
  }

  Future<void> pressEnter() async {
    if (location == 0) {
      state = const CommonState.error('Select Location.');
      return;
    }

    final wifi = await ref.read(wifiStatusProvider.notifier).checkConnection();
    if (!wifi) {
      state = const CommonState.initial();
      return;
    }

    state = await CommonState.guard(
        () => ref.read(locationDetailsServiceProvider).getLocationDetails());
  }

  void pressDetails(BuildContext context) {
    if (location == 0) {
      context.showSnackBar('Select Location');
    } else {
      Navigator.of(context).pushNamed(
        App.locationCompleteDetailsPage,
        arguments: location,
      );
    }
  }
}
