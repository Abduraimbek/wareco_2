import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../repository/add_pallet_to_location_response.dart';

part 'add_pallet_to_location_service.g.dart';

@riverpod
AddPalletToLocationService addPalletToLocationService(
    AddPalletToLocationServiceRef ref) {
  return AddPalletToLocationService();
}

class AddPalletToLocationService {
  Future<AddPalletToLocationResponse> getAddPalletToLocationResponse() async {
    return const AddPalletToLocationResponse(
      pallet: 'pallet',
      location: 'location',
    );
  }
}
