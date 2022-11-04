import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wareco_2/src/features/functionalities/functionalities.dart';

part 'store_no_service.g.dart';

@riverpod
StoreNoService storeNoService(StoreNoServiceRef ref) {
  return StoreNoService();
}

class StoreNoService {
  Future<List<StoreNoModel>> getStoreNos() async {
    return const [
      StoreNoModel(number: 1),
      StoreNoModel(number: 2),
      StoreNoModel(number: 3),
      StoreNoModel(number: 4),
      StoreNoModel(number: 5),
    ];
  }
}
