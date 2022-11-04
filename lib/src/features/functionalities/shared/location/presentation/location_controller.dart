import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wareco_2/src/features/functionalities/functionalities.dart';

import '../application/location_service.dart';

part 'location_controller.g.dart';

@riverpod
FutureOr<List<LocationModel>> locationsController(LocationsControllerRef ref) {
  return ref.read(locationServiceProvider).getLocations();
}

@riverpod
class SelectedLocationController extends _$SelectedLocationController {
  @override
  LocationModel? build() {
    return null;
  }

  void selectLocation(LocationModel? locationModel) {
    state = locationModel;
  }
}
