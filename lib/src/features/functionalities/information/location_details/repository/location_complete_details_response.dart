import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_complete_details_response.freezed.dart';

@freezed
class LocationCompleteDetailsResponse with _$LocationCompleteDetailsResponse {
  const factory LocationCompleteDetailsResponse({
    required String data,
  }) = _LocationCompleteDetailsResponse;
}
