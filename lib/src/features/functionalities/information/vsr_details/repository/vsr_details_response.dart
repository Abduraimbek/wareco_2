import 'package:freezed_annotation/freezed_annotation.dart';

part 'vsr_details_response.freezed.dart';

@freezed
class VsrDetailsResponse with _$VsrDetailsResponse {
  const factory VsrDetailsResponse({
    required String data,
  }) = _VsrDetailsResponse;
}
