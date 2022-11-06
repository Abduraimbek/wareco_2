import 'package:freezed_annotation/freezed_annotation.dart';

part 'common_state.freezed.dart';

@freezed
class CommonState<T> with _$CommonState<T> {
  const factory CommonState.initial() = CommonInitialState<T>;

  const factory CommonState.loading([
    @Default('Loading...') String message,
  ]) = CommonLoadingState<T>;

  const factory CommonState.error([
    @Default('Unknown Error') String message,
  ]) = CommonErrorState<T>;

  const factory CommonState.data({
    required T data,
  }) = CommonDataSTate<T>;

  static Future<CommonState<T>> guard<T>(Future<T> Function() future) async {
    try {
      return CommonState.data(data: await future());
    } catch (e) {
      return CommonState.error(e.toString());
    }
  }
}
