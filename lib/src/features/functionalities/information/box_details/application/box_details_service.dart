import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wareco_2/src/app.dart';

import '../repository/box_details_response.dart';

part 'box_details_service.g.dart';

@Riverpod(keepAlive: true)
BoxDetailsService boxDetailsService(BoxDetailsServiceRef ref) {
  return BoxDetailsService();
}

class BoxDetailsService {
  Future<BoxDetailsResponse> getBoxDetailsResponse() async {
    return const BoxDetailsResponse(
      data: loremIpsum,
    );
  }
}
