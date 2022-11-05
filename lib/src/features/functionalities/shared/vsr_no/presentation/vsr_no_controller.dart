import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wareco_2/src/features/functionalities/functionalities.dart';

import '../application/vsr_no_service.dart';

part 'vsr_no_controller.g.dart';

@riverpod
FutureOr<List<VsrNoModel>> vsrNosController(VsrNosControllerRef ref) {
  return ref.read(vsrNoServiceProvider).getVsrNos();
}

@riverpod
class SelectedVsrNoController extends _$SelectedVsrNoController {
  @override
  VsrNoModel? build() {
    return null;
  }

  void selectVsrNo(VsrNoModel? vsrNoModel) {
    state = vsrNoModel;
  }
}
