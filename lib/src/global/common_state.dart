import 'package:freezed_annotation/freezed_annotation.dart';

part 'common_state.freezed.dart';

@freezed
class CommonState<T> with _$CommonState<T> {
  const factory CommonState.initial() = _Initial<T>;

  const factory CommonState.loading([
    @Default('Loading...') String message,
  ]) = _Loading<T>;

  const factory CommonState.error([
    @Default('Unknown Error') String message,
  ]) = _Error<T>;

  const factory CommonState.data({
    required T data,
  }) = _Data<T>;
}
