import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wareco_2/src/features/login/login.dart';
import 'package:wareco_2/src/global/language/language_provider.dart';

class RememberMe extends ConsumerWidget {
  const RememberMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => ref.read(loginRememberMeProvider.notifier).changeState(),
      child: Container(
        padding: const EdgeInsets.only(top: 10),
        color: Colors.transparent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Checkbox(
              value: ref.watch(loginRememberMeProvider),
              onChanged: (_) =>
                  ref.read(loginRememberMeProvider.notifier).changeState(),
            ),
            Text(ref.watch(languageProvider).rememberMe),
          ],
        ),
      ),
    );
  }
}
