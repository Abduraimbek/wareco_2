import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../repository/auto_palletize_reponse.dart';

part 'auto_palletize_service.g.dart';

@riverpod
AutoPalletizeService autoPalletizeService(AutoPalletizeServiceRef ref) {
  return AutoPalletizeService();
}

class AutoPalletizeService {
  Future<AutoPalletizeResponse> getAutoPalletizeResponse() async {
    return const AutoPalletizeResponse(
      pallet: 'pallet',
      location: 'location',
    );
  }
}
