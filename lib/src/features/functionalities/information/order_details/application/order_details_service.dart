import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wareco_2/src/app.dart';

import '../repository/order_details_response.dart';

part 'order_details_service.g.dart';

@Riverpod(keepAlive: true)
OrderDetailsService orderDetailsService(OrderDetailsServiceRef ref) {
  return OrderDetailsService();
}

class OrderDetailsService {
  Future<OrderDetailsResponse> getOrderDetailsResponse() async {
    return const OrderDetailsResponse(data: loremIpsum);
  }
}
