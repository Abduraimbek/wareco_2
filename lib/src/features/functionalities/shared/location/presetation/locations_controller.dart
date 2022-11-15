import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../repository/location_model.dart';
import '../application/location_service.dart';

part 'locations_controller.g.dart';

@riverpod
FutureOr<List<LocationModel>> locationsController(LocationsControllerRef ref) {
  return ref.watch(locationServiceProvider).getLocations();
}
