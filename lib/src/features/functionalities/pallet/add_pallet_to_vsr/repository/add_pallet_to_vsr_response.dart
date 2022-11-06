import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_pallet_to_vsr_response.freezed.dart';

@freezed
class AddPalletToVsrResponse with _$AddPalletToVsrResponse {
  const factory AddPalletToVsrResponse({
    required String pallet,
    required String vsr,
  }) = _AddPalletToVsrResponse;
}
