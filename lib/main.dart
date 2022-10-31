import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wareco_2/src/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Set Device orientation only UP
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarIconBrightness: Brightness.dark,
  ));

  runApp(const ProviderScope(child: App()));
}
