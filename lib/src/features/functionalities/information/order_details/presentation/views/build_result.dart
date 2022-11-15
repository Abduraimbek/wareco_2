import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/order_details_controller.dart';

class BuildResult extends ConsumerWidget {
  const BuildResult({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(orderDetailsControllerProvider);

    return state.when(
      initial: () {
        return Container();
      },
      loading: (message) {
        return Center(
          child: Text(message),
        );
      },
      error: (message) {
        return Center(
          child: Text(message),
        );
      },
      data: (data) {
        return Scrollbar(
          thumbVisibility: true,
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(right: 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data.data),
              ],
            ),
          ),
        );
      },
    );
  }
}
