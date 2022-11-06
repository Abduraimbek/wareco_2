import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../repository/add_pallet_to_vsr_response.dart';

part 'add_pallet_to_vsr_service.g.dart';

@riverpod
AddPalletToVsrService addPalletToVsrService(AddPalletToVsrServiceRef ref) {
  return AddPalletToVsrService();
}

class AddPalletToVsrService {
  Future<AddPalletToVsrResponse> getAddPalletToVsrResponse() async {
    return const AddPalletToVsrResponse(
      pallet: 'pallet',
      vsr: 'vsr',
    );
  }
}
