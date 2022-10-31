import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'close_by_last_box_provider.g.dart';

@riverpod
class CloseByLastBox extends _$CloseByLastBox {
  @override
  bool build() {
    return false;
  }

  void changeState() {
    state = !state;
  }
}
