import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../repository/remove_pallet_from_location_response.dart';

part 'remove_pallet_from_location_service.g.dart';

@riverpod
RemovePalletFromLocationService removePalletFromLocationService(
    RemovePalletFromLocationServiceRef ref) {
  return RemovePalletFromLocationService();
}

class RemovePalletFromLocationService {
  Future<RemovePalletFromLocationResponse>
      getRemovePalletFromLocationResponse() async {
    return const RemovePalletFromLocationResponse(
      pallet: 'pallet',
      location: 'location',
    );
  }
}
