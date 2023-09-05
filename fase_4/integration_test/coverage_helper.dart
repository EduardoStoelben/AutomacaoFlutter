import 'dart:io';

void removeCoverageFile(String fileName) {
  final lcovFilePath = 'coverage/lcov.info';

  final lcovFile = File(lcovFilePath);

  if (!lcovFile.existsSync()) {
    print('Arquivo $lcovFilePath não encontrado.');
    return;
  }

  final lines = lcovFile.readAsLinesSync();

  final modifiedLines = <String>[];
  bool shouldRemove = false;

  for (final line in lines) {
    if (line.startsWith('SF:$fileName')) {
      shouldRemove = true;
      continue;
    }

    if (shouldRemove && line.startsWith('end_of_record')) {
      shouldRemove = false;
      continue;
    }

    if (!shouldRemove) {
      modifiedLines.add(line);
    }
  }

  lcovFile.writeAsStringSync(modifiedLines.join('\n'));

  print('Arquivo $fileName removido do relatório de cobertura.');
}

void main() {
  // ignore: unnecessary_string_escapes
  removeCoverageFile('lib\\models\\deck.model.g.dart');
  removeCoverageFile('lib\\models\\question.model.g.dart');
  removeCoverageFile('lib\\pages\\deck_detail\\deck_detail.store.g.dart');
  removeCoverageFile('lib\\pages\\add_question\\add_question.store.g.dart');
  removeCoverageFile('lib\\pages\\decks\\decks.store.g.dart');
  removeCoverageFile('lib\\pages\\quiz\\quiz.store.g.dart');
}