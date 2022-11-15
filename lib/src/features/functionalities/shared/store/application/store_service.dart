import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../repository/store_model.dart';

part 'store_service.g.dart';

@Riverpod(keepAlive: true)
StoreService storeService(StoreServiceRef ref) {
  return StoreService();
}

class StoreService {
  Future<List<StoreModel>> getStores() async {
    await Future.delayed(const Duration(seconds: 2));
    return const [
      StoreModel(number: 1),
      StoreModel(number: 2),
      StoreModel(number: 3),
    ];
  }
}
