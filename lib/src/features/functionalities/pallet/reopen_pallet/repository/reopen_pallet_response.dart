import 'package:freezed_annotation/freezed_annotation.dart';

part 'reopen_pallet_response.freezed.dart';

@freezed
class ReopenPalletResponse with _$ReopenPalletResponse {
  const factory ReopenPalletResponse({
    required String pallet,
  }) = _ReopenPalletResponse;
}
