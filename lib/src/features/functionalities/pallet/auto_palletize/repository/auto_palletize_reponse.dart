import 'package:freezed_annotation/freezed_annotation.dart';

part 'auto_palletize_reponse.freezed.dart';

@freezed
class AutoPalletizeResponse with _$AutoPalletizeResponse {
  const factory AutoPalletizeResponse({
    required String pallet,
    required String location,
  }) = _AutoPalletizeResponse;
}
