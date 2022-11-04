import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wareco_2/src/features/functionalities/functionalities.dart';

part 'location_service.g.dart';

@riverpod
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
