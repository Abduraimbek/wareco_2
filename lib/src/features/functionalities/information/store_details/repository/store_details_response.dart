import 'package:freezed_annotation/freezed_annotation.dart';

part 'store_details_response.freezed.dart';

@freezed
class StoreDetailsResponse with _$StoreDetailsResponse {
  const factory StoreDetailsResponse({
    required String data,
  }) = _StoreDetailsResponse;
}
