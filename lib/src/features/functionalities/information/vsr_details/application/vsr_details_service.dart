import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wareco_2/src/app.dart';

import '../repository/vsr_details_response.dart';

part 'vsr_details_service.g.dart';

@Riverpod(keepAlive: true)
VsrDetailsService vsrDetailsService(VsrDetailsServiceRef ref) {
  return VsrDetailsService();
}

class VsrDetailsService {
  Future<VsrDetailsResponse> getVsrDetails() async {
    return const VsrDetailsResponse(
      data: loremIpsum,
    );
  }
}
