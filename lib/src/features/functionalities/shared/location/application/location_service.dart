import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../repository/location_model.dart';

part 'location_service.g.dart';

@Riverpod(keepAlive: true)
LocationService locationService(LocationServiceRef ref) {
  return LocationService();
}

class LocationService {
  Future<List<LocationModel>> getLocations() async {
    return const [
      LocationModel(number: 1),
      LocationModel(number: 2),
      LocationModel(number: 3),
      LocationModel(number: 4),
    ];
  }
}
