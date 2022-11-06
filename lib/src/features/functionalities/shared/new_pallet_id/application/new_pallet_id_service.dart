import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wareco_2/src/features/functionalities/functionalities.dart';

part 'new_pallet_id_service.g.dart';

@riverpod
NewPalletIdService newPalletIdService(NewPalletIdServiceRef ref) {
  return NewPalletIdService();
}

class NewPalletIdService {
  Future<List<NewPalletIdModel>> getNewPalletIds() async {
    return const [
      NewPalletIdModel(number: 1),
      NewPalletIdModel(number: 2),
      NewPalletIdModel(number: 3),
      NewPalletIdModel(number: 4),
    ];
  }
}
