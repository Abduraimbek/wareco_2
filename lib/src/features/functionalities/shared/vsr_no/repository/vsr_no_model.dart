import 'package:freezed_annotation/freezed_annotation.dart';

part 'vsr_no_model.freezed.dart';

@freezed
class VsrNoModel with _$VsrNoModel {
  const factory VsrNoModel({
    required int number,
  }) = _VsrNoModel;
}
