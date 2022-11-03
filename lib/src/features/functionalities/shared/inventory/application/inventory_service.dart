import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wareco_2/src/features/functionalities/functionalities.dart';

part 'inventory_service.g.dart';

@riverpod
InventoryService inventoryService(InventoryServiceRef ref) {
  return InventoryService();
}

class InventoryService {
  Future<List<InventoryModel>> getInventories() async {
    await Future.delayed(const Duration(milliseconds: 50));
    return const [
      InventoryModel(number: 1),
      InventoryModel(number: 2),
      InventoryModel(number: 3),
      InventoryModel(number: 4),
      InventoryModel(number: 5),
      InventoryModel(number: 6),
      InventoryModel(number: 7),
    ];
  }
}
