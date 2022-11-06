import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_pallet_to_location_response.freezed.dart';

@freezed
class AddPalletToLocationResponse with _$AddPalletToLocationResponse {
  const factory AddPalletToLocationResponse({
    required String pallet,
    required String location,
  }) = _AddPalletToLocationResponse;
}
