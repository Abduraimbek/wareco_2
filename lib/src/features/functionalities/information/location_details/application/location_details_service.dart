import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wareco_2/src/app.dart';

import '../repository/location_complete_details_response.dart';
import '../repository/location_details_response.dart';

part 'location_details_service.g.dart';

@Riverpod(keepAlive: true)
LocationDetailsService locationDetailsService(LocationDetailsServiceRef ref) {
  return LocationDetailsService();
}

class LocationDetailsService {
  Future<LocationDetailsResponse> getLocationDetails() async {
    return const LocationDetailsResponse(
      data: loremIpsum,
    );
  }

  Future<LocationCompleteDetailsResponse> getLocationCompleteDetails() async {
    return const LocationCompleteDetailsResponse(
      data: loremIpsum,
    );
  }
}
