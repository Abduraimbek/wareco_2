import 'package:freezed_annotation/freezed_annotation.dart';

part 'close_pallet_response.freezed.dart';

@freezed
class ClosePalletResponse with _$ClosePalletResponse {
  const factory ClosePalletResponse({
    required String pallet,
  }) = _ClosePalletResponse;
}
