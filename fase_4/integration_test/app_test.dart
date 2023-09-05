import 'package:fase_4/models/deck.model.dart';
import 'package:fase_4/models/question.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:integration_test/integration_test.dart';
import 'package:get_it/get_it.dart';

import '../lib/main.dart' as app;
import 'json.dart';



void main() {

final List<TestResult> results = [];

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  tearDown(() async {
    await Future.delayed(Duration(seconds: 2));
    GetIt getIt = GetIt.instance;
    getIt.reset(dispose: true);
    Hive.resetAdapters();
  });
  tearDownAll(() => enviarDadosComoJson(results));
    group('teste end-to-end', () {
    testWidgets('Validação da tela principal',
        (tester) async {
           results.add(TestResult(title: 'Validação da tela principal', approved: false));
      app.main();
      await tester.pumpAndSettle();
      expect(find.byKey(Key('image')), findsOneWidget);
      expect(find.byKey(Key('btnOutlineAdicionar')), findsOneWidget);
      expect(find.byKey(Key('btnAdicionar')), findsOneWidget);
      expect(find.text('Decks'), findsOneWidget);
   results.last.approved = true;
    });

    testWidgets('Criando o primeiro deck',
        (tester) async {
           results.add(TestResult(title: 'Criando o primeiro deck', approved: false));
      app.main();
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(Key('btnOutlineAdicionar')));
      await tester.pumpAndSettle();
      await tester.enterText(find.byKey(Key('tituloDeck')), 'deck 1');
      await tester.tap(find.byKey(Key('btnAdicionarDeck')));
   results.last.approved = true;
    });
  
    testWidgets('Acessando o deck criado',
        (tester) async {
           results.add(TestResult(title: 'Acessando o deck criado', approved: false));
      app.main();
      await tester.pumpAndSettle();
      await tester.tap(find.text('deck 1'));
      await tester.pumpAndSettle();
      expect(find.text('deck 1'), findsWidgets);
      expect(find.text('0 cartões'), findsOneWidget);
      expect(find.byKey(Key('addCard')), findsOneWidget);
      expect(find.byKey(Key('startQuiz')), findsOneWidget);
      await tester.tap(find.byKey(Key('btnvoltar')));
      await Future.delayed(Duration(seconds: 1));

   results.last.approved = true;
    });

    testWidgets('Adicionando um cartão',
        (tester) async {
           results.add(TestResult(title: 'Adicionando um cartão', approved: false));
      app.main();
      await tester.pumpAndSettle();
      await tester.tap(find.text('deck 1'));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(Key('addCard')));
      await tester.pumpAndSettle();
      await tester.enterText(find.byKey(Key('inputPergunta')), 'isso é um teste automatizado?');
      await tester.enterText(find.byKey(Key('inputResposta')), 'Sim');
      await tester.tap(find.byKey(Key('addCardQuestion')));
      await tester.pumpAndSettle();
      expect(find.text('1 cartões'), findsOneWidget);

   results.last.approved = true;
    });

    testWidgets('Adicionando mais um cartão',
        (tester) async {
           results.add(TestResult(title: 'Adicionando mais um cartão', approved: false));
      app.main();
      await tester.pumpAndSettle();
      await tester.tap(find.text('deck 1'));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(Key('addCard')));
      await tester.pumpAndSettle();
      await tester.enterText(find.byKey(Key('inputPergunta')), 'Como ele foi desenvolvido?');
      await tester.enterText(find.byKey(Key('inputResposta')), 'Com flutter');
      await tester.tap(find.byKey(Key('addCardQuestion')));
      await tester.pumpAndSettle();
      expect(find.text('2 cartões'), findsOneWidget);
      await tester.tap(find.byKey(Key('btnvoltar')));
      await tester.pumpAndSettle();
      await Future.delayed(Duration(seconds: 2));

   results.last.approved = true;
    });

    testWidgets('Iniciando quiz 2 acertos',
        (tester) async {
           results.add(TestResult(title: 'Iniciando quiz 2 acertos', approved: false));
      app.main();
      await tester.pumpAndSettle();
      await tester.tap(find.text('deck 1'));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(Key('startQuiz')));
      await tester.pumpAndSettle();
      expect(find.text('1 / 2'), findsOneWidget);
      expect(find.text('isso é um teste automatizado?'), findsOneWidget);
      await tester.tap(find.text('Visualizar resposta'));
      await tester.pumpAndSettle();
      expect(find.text('Sim'), findsOneWidget);
      await tester.tap(find.text('Visualizar pergunta'));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(Key('btnAcertei')));
      await tester.pumpAndSettle();
      expect(find.text('2 / 2'), findsOneWidget);
      expect(find.text('Como ele foi desenvolvido?'), findsOneWidget);
      await tester.tap(find.text('Visualizar resposta'));
      await tester.pumpAndSettle();
      expect(find.text('Com flutter'), findsOneWidget);
      await tester.tap(find.byKey(Key('btnAcertei')));
      await tester.pumpAndSettle();
      //expect(ResultQuiz.score, 2);
      expect(find.text('O quiz acabou.\nVocê fez 2 ponto(s)'), findsWidgets);
      await tester.tap(find.byKey(Key('btnVoltar')));

   results.last.approved = true;
    });

    testWidgets('Iniciando quiz 1 acerto e 1 erro',
        (tester) async {
           results.add(TestResult(title: 'Iniciando quiz 1 acerto e 1 erro', approved: false));
      app.main();
      await tester.pumpAndSettle();
      await tester.tap(find.text('deck 1'));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(Key('startQuiz')));
      await tester.pumpAndSettle();
      expect(find.text('1 / 2'), findsOneWidget);
      expect(find.text('isso é um teste automatizado?'), findsOneWidget);
      await tester.tap(find.text('Visualizar resposta'));
      await tester.pumpAndSettle();
      expect(find.text('Sim'), findsOneWidget);
      await tester.tap(find.byKey(Key('btnAcertei')));
      await tester.pumpAndSettle();
      expect(find.text('2 / 2'), findsOneWidget);
      expect(find.text('Como ele foi desenvolvido?'), findsOneWidget);
      await tester.tap(find.text('Visualizar resposta'));
      await tester.pumpAndSettle();
      expect(find.text('Com flutter'), findsOneWidget);
      await tester.tap(find.byKey(Key('btnErrei')));
      await tester.pumpAndSettle();
      //expect(ResultQuiz.score, 2);
      expect(find.text('O quiz acabou.\nVocê fez 1 ponto(s)'), findsWidgets);
      await tester.tap(find.byKey(Key('btnVoltar')));

   results.last.approved = true;
    });
    
    testWidgets('Iniciando quiz 2 erros',
        (tester) async {
           results.add(TestResult(title: 'Iniciando quiz 2 erros', approved: false));
      app.main();
      await tester.pumpAndSettle();
      await tester.tap(find.text('deck 1'));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(Key('startQuiz')));
      await tester.pumpAndSettle();
      expect(find.text('1 / 2'), findsOneWidget);
      expect(find.text('isso é um teste automatizado?'), findsOneWidget);
      await tester.tap(find.text('Visualizar resposta'));
      await tester.pumpAndSettle();
      expect(find.text('Sim'), findsOneWidget);
      await tester.tap(find.byKey(Key('btnErrei')));
      await tester.pumpAndSettle();
      expect(find.text('2 / 2'), findsOneWidget);
      expect(find.text('Como ele foi desenvolvido?'), findsOneWidget);
      await tester.tap(find.text('Visualizar resposta'));
      await tester.pumpAndSettle();
      expect(find.text('Com flutter'), findsOneWidget);
      await tester.tap(find.byKey(Key('btnErrei')));
      await tester.pumpAndSettle();
      //expect(ResultQuiz.score, 2);
      expect(find.text('O quiz acabou.\nVocê fez 0 ponto(s)'), findsWidgets);
      await tester.tap(find.byKey(Key('btnVoltar')));

   results.last.approved = true;
    });

    testWidgets('Excluindo o deck',
        (tester) async {
           results.add(TestResult(title: 'Excluindo o deck', approved: false));
      app.main();
      await tester.pumpAndSettle();
      await tester.longPress(find.text('deck 1'));
      await tester.pumpAndSettle();
      expect(find.byKey(Key('image')), findsOneWidget);

   results.last.approved = true;
    });

    test('teste',
        () async {
 
      final deck=Deck(id: "Any", name: "Any");
      final deck2=deck.copyWith();
      expect(deck.id, deck2.id);
      expect(deck.name, deck2.name);
      expect(deck.questions.length, deck2.questions.length);

      final deck3=deck.copyWith(id: "123", name: "123", questions: [Question(id: "321", ask: "321", answer: "321")]);
      expect(deck.id, isNot(deck3.id));
      expect(deck.name, isNot(deck3.name)); 
      expect(deck.questions.length,isNot(deck3.questions.length));

    });
   });

}