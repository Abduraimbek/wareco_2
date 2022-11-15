import 'package:freezed_annotation/freezed_annotation.dart';

part 'box_details_response.freezed.dart';

@freezed
class BoxDetailsResponse with _$BoxDetailsResponse {
  const factory BoxDetailsResponse({
    required String data,
  }) = _BoxDetailsResponse;
}
