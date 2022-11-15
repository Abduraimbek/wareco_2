import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_details_response.freezed.dart';

@freezed
class OrderDetailsResponse with _$OrderDetailsResponse {
  const factory OrderDetailsResponse({
    required String data,
  }) = _OrderDetailsResponse;
}
