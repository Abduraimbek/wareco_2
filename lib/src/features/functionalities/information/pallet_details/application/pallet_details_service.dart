import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wareco_2/src/app.dart';

import '../repository/pallet_details_response.dart';

part 'pallet_details_service.g.dart';

@Riverpod(keepAlive: true)
PalletDetailsService palletDetailsService(PalletDetailsServiceRef ref) {
  return PalletDetailsService();
}

class PalletDetailsService {
  Future<PalletDetailsResponse> getPalletDetails() async {
    return const PalletDetailsResponse(
      data: loremIpsum,
    );
  }
}
