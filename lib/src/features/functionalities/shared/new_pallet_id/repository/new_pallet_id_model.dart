import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_pallet_id_model.freezed.dart';

@freezed
class NewPalletIdModel with _$NewPalletIdModel {
  const factory NewPalletIdModel({
    required int number,
  }) = _NewPalletIdModel;
}
