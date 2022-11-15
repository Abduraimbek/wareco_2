import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wareco_2/src/app.dart';

import '../repository/store_details_response.dart';

part 'store_details_service.g.dart';

@Riverpod(keepAlive: true)
StoreDetailsService storeDetailsService(StoreDetailsServiceRef ref) {
  return StoreDetailsService();
}

class StoreDetailsService {
  Future<StoreDetailsResponse> getStoreDetailsResponse() async {
    return const StoreDetailsResponse(
      data: loremIpsum,
    );
  }
}
