import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../repository/store_model.dart';
import '../application/store_service.dart';

part 'stores_controller.g.dart';

@riverpod
FutureOr<List<StoreModel>> storesController(StoresControllerRef ref) {
  return ref.watch(storeServiceProvider).getStores();
}
