import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wareco_2/src/features/functionalities/functionalities.dart';

import '../application/inventory_service.dart';

part 'inventory_controller.g.dart';

@riverpod
Future<List<InventoryModel>> inventoriesController(
    InventoriesControllerRef ref) async {
  return ref.read(inventoryServiceProvider).getInventories();
}

@riverpod
class SelectedInventoryController extends _$SelectedInventoryController {
  @override
  InventoryModel? build() {
    return null;
  }

  void selectInventory(InventoryModel? inventoryModel) {
    state = inventoryModel;
  }
}
