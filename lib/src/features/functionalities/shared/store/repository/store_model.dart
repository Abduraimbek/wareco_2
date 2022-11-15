import 'package:freezed_annotation/freezed_annotation.dart';

part 'store_model.freezed.dart';

@freezed
class StoreModel with _$StoreModel {
  const factory StoreModel({
    required int number,
  }) = _StoreModel;
}
