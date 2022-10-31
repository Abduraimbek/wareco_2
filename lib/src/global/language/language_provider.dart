import 'package:wareco_2/src/global/language/language.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'language_provider.g.dart';

@Riverpod(keepAlive: true)
Language language(LanguageRef ref) {
  return const Language();
}
