import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dimensions_and_weight_controller.g.dart';
part 'dimensions_and_weight_controller.freezed.dart';

@riverpod
class DimensionsAndWeightController extends _$DimensionsAndWeightController {
  @override
  DimensionsAndWeightState build() {
    return const DimensionsAndWeightState();
  }

  void typeLength(int length) {
    state = state.copyWith(length: length);
  }

  void typeHeight(int height) {
    state = state.copyWith(height: height);
  }

  void typeWidth(int width) {
    state = state.copyWith(width: width);
  }

  void typeWeight(double weight) {
    state = state.copyWith(weight: weight);
  }
}

@freezed
class DimensionsAndWeightState with _$DimensionsAndWeightState {
  const factory DimensionsAndWeightState({
    @Default(0) int length,
    @Default(0) int height,
    @Default(0) int width,
    @Default(0.0) double weight,
  }) = _DimensionsAndWeightState;
}
