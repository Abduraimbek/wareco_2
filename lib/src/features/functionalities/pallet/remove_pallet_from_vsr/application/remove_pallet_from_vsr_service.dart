import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../repository/remove_pallet_from_vsr_response.dart';

part 'remove_pallet_from_vsr_service.g.dart';

@riverpod
RemovePalletFromVsrService removePalletFromVsrService(
    RemovePalletFromVsrServiceRef ref) {
  return RemovePalletFromVsrService();
}

class RemovePalletFromVsrService {
  Future<RemovePalletFromVsrResponse> getRemovePalletFromVsrReponse() async {
    return const RemovePalletFromVsrResponse(
      pallet: 'pallet',
      vsr: 'vsr',
    );
  }
}
