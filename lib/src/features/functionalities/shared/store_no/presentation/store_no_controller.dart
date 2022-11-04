import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wareco_2/src/features/functionalities/functionalities.dart';

import '../application/store_no_service.dart';

part 'store_no_controller.g.dart';

@riverpod
Future<List<StoreNoModel>> storeNosController(StoreNosControllerRef ref) async {
  return ref.read(storeNoServiceProvider).getStoreNos();
}

@riverpod
class SelectedStoreNoController extends _$SelectedStoreNoController {
  @override
  StoreNoModel? build() {
    return null;
  }

  void selectStoreNo(StoreNoModel? storeNoModel) {
    state = storeNoModel;
  }
}
