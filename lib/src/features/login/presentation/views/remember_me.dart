import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wareco_2/src/features/login/login.dart';
import 'package:wareco_2/src/global/language/language_provider.dart';

class RememberMe extends ConsumerWidget {
  const RememberMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CheckboxListTile(
      value: ref.watch(loginRememberMeProvider),
      onChanged: (_) =>
          ref.read(loginRememberMeProvider.notifier).changeState(),
      title: Text(
        ref.watch(languageProvider).rememberMe,
        style: Theme.of(context).textTheme.bodyText2,
      ),
      controlAffinity: ListTileControlAffinity.leading,
      contentPadding: EdgeInsets.zero,
    );
  }
}
