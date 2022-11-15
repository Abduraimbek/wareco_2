import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_details_response.freezed.dart';

@freezed
class LocationDetailsResponse with _$LocationDetailsResponse {
  const factory LocationDetailsResponse({
    required String data,
  }) = _LocationDetailsResponse;
}
