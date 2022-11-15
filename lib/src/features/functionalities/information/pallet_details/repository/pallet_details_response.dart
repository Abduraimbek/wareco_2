import 'package:freezed_annotation/freezed_annotation.dart';

part 'pallet_details_response.freezed.dart';

@freezed
class PalletDetailsResponse with _$PalletDetailsResponse {
  const factory PalletDetailsResponse({
    required String data,
  }) = _PalletDetailsResponse;
}
