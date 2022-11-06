import 'package:freezed_annotation/freezed_annotation.dart';

part 'remove_pallet_from_location_response.freezed.dart';

@freezed
class RemovePalletFromLocationResponse with _$RemovePalletFromLocationResponse {
  const factory RemovePalletFromLocationResponse({
    required String pallet,
    required String location,
  }) = _RemovePalletFromLocationResponse;
}
