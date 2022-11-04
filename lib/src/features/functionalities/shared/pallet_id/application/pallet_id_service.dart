import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wareco_2/src/features/functionalities/functionalities.dart';

part 'pallet_id_service.g.dart';

@riverpod
PalletIdService palletIdService(PalletIdServiceRef ref) {
  return PalletIdService();
}

class PalletIdService {
  Future<List<PalletIdModel>> getPalletIds() async {
    return const [
      PalletIdModel(number: 1),
      PalletIdModel(number: 2),
      PalletIdModel(number: 3),
      PalletIdModel(number: 4),
      PalletIdModel(number: 5),
    ];
  }
}
