import 'package:freezed_annotation/freezed_annotation.dart';

part 'remove_pallet_from_vsr_response.freezed.dart';

@freezed
class RemovePalletFromVsrResponse with _$RemovePalletFromVsrResponse {
  const factory RemovePalletFromVsrResponse({
    required String pallet,
    required String vsr,
  }) = _RemovePalletFromVsrResponse;
}
