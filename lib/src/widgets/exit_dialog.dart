import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wareco_2/src/global/language/language_provider.dart';

Future showMyExitAppDialog(BuildContext context) async {
  return showDialog(
    context: context,
    builder: (context) {
      return Consumer(
        builder: (context, ref, _) {
          final lan = ref.watch(languageProvider);

          return AlertDialog(
            title: Text(lan.exit),
            content: Text(lan.areYouSureYouWantToExit),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: Text(lan.exit),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(lan.cancel),
              ),
            ],
          );
        },
      );
    },
  );
}
