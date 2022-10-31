import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wareco_2/src/global/language/language_provider.dart';

import '../providers/close_by_last_box_provider.dart';

class BuildCloseByLastBox extends ConsumerWidget {
  const BuildCloseByLastBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: CheckboxListTile(
        value: ref.watch(closeByLastBoxProvider),
        onChanged: (_) =>
            ref.read(closeByLastBoxProvider.notifier).changeState(),
        controlAffinity: ListTileControlAffinity.leading,
        dense: true,
        contentPadding: EdgeInsets.zero,
        title: Text(
          ref.watch(languageProvider).closeByLastBox,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
