import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:shopping_cart/main.dart' as app;
import 'json.dart';


void main() {
  
final List<TestResult> results = [];

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  tearDown(() async => await Future.delayed(const Duration(seconds: 2)));
  tearDownAll(() => enviarDadosComoJson(results));
    group('end-to-end test', () {
    testWidgets('Validação do título da tela inicial',
        (tester) async {
           results.add(TestResult(title: 'Validação do título da tela inicial', aproved: false));
      app.main();
      await tester.pumpAndSettle();

      expect(find.byKey(const ValueKey('tittle')), findsOneWidget);
      expect(find.text('Minhas listas'), findsOneWidget);
   results.last.aproved = true;
    });
    testWidgets('Validação do icone da tela inicial',
        (tester) async {
           results.add(TestResult(title: 'Validação do icone da tela inicial', aproved: false));
      app.main();
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.diamond), findsOneWidget);
   results.last.aproved = true;
    });
    testWidgets('Validação da imagem da tela inicial',
        (tester) async {
           results.add(TestResult(title: 'Validação da imagem da tela inicial', aproved: false));
      app.main();
      await tester.pumpAndSettle();

      expect(find.byKey(const ValueKey('image')), findsOneWidget);
   results.last.aproved = true;
    });
    testWidgets('Validação dos textos da tela inicial',
        (tester) async {
           results.add(TestResult(title: 'Validação dos textos da tela inicial', aproved: false));
      app.main();
      await tester.pumpAndSettle();

      expect(find.text('Crie sua primeira lista.'), findsOneWidget);
      expect(find.text('Toque no botao azul'), findsOneWidget);
   results.last.aproved = true;
    });

    testWidgets('Validação do botão para adicionar na tela inicial',
        (tester) async {
           results.add(TestResult(title: 'Validação do botão para adicionar na tela inicial', aproved: false));
      app.main();
      await tester.pumpAndSettle();

      expect(find.byKey(const ValueKey('btnAdd')), findsOneWidget);
   results.last.aproved = true;
    });
    
    testWidgets('Validação da tela para adicionar',
        (tester) async {
           results.add(TestResult(title: 'Validação da tela para adicionar', aproved: false));
      app.main();
      await tester.pumpAndSettle();

      expect(find.byKey(const ValueKey('btnAdd')), findsOneWidget);
      await tester.tap(find.byKey(const ValueKey('btnAdd')));
      await Future.delayed(Duration(seconds: 2));
      expect(find.byKey(const ValueKey('input')), findsOneWidget);
      expect(find.byKey(const ValueKey('BtnVoltar')), findsOneWidget);
      expect(find.byKey(const ValueKey('BtnCriar')), findsOneWidget);
      await tester.tap(find.byKey(const ValueKey('BtnVoltar')));
   results.last.aproved = true;
    });

    testWidgets('Validação da criação de lista',
        (tester) async {
           results.add(TestResult(title: 'Validação da criação de lista', aproved: false));
      app.main();
      await tester.pumpAndSettle();

      expect(find.byKey(const ValueKey('btnAdd')), findsOneWidget);
      await tester.tap(find.byKey(const ValueKey('btnAdd')));
      await Future.delayed(Duration(seconds: 2));
      expect(find.byKey(const ValueKey('input')), findsOneWidget);
      await tester.enterText(find.byKey(ValueKey('input')), ('lista 1'));
      await tester.tap(find.byKey(const ValueKey('BtnCriar')));
   results.last.aproved = true;
    });

    testWidgets('Validação da criação de lista',
        (tester) async {
           results.add(TestResult(title: 'Validação da criação de lista', aproved: false));
      app.main();
      await tester.pumpAndSettle();

      expect(find.byKey(const ValueKey('btnAdd')), findsOneWidget);
      await tester.tap(find.byKey(const ValueKey('btnAdd')));
      await Future.delayed(Duration(seconds: 2));
      expect(find.byKey(const ValueKey('input')), findsOneWidget);
      await tester.enterText(find.byKey(ValueKey('input')), ('teste'));
      await tester.tap(find.byKey(const ValueKey('BtnCriar')));
      await Future.delayed(Duration(seconds: 3));
      expect(find.byKey(const ValueKey('card')), findsOneWidget);
      expect(find.text('teste'), findsWidgets);
      expect(find.text('0/0'), findsOneWidget);
   results.last.aproved = true;
    });

    testWidgets('Validação de campos obrigatorios na lista',
        (tester) async {
           results.add(TestResult(title: 'Validação de campos obrigatorios na lista', aproved: false));
      app.main();
      await tester.pumpAndSettle();

      expect(find.byKey(const ValueKey('btnAdd')), findsOneWidget);
      await tester.tap(find.byKey(const ValueKey('btnAdd')));
      await Future.delayed(Duration(seconds: 2));
      expect(find.byKey(const ValueKey('input')), findsOneWidget);
      await tester.enterText(find.byKey(ValueKey('input')), ('teste'));
      await tester.tap(find.byKey(const ValueKey('BtnCriar')));
      await Future.delayed(Duration(seconds: 3));
      expect(find.byKey(const ValueKey('card')), findsOneWidget);
      expect(find.text('teste'), findsWidgets);
      expect(find.text('0/0'), findsOneWidget);
      await tester.tap(find.byKey(ValueKey('card')));
      await tester.pumpAndSettle();
      await Future.delayed(Duration(seconds: 3));
      await tester.tap(find.text('Adicionar'));
      await Future.delayed(Duration(seconds: 3));
      expect(find.text('Adicionar item'), findsOneWidget);
      await tester.tap(find.byKey(const ValueKey('BtnAdicionar')));
      await Future.delayed(Duration(seconds: 3));
      await tester.pumpAndSettle();
      expect(find.text('Adicionar item'), findsOneWidget);

   results.last.aproved = true;
    });

    testWidgets('Validação de criação de item na lista',
        (tester) async {
           results.add(TestResult(title: 'Validação de criação de item na lista', aproved: false));
      app.main();
      await tester.pumpAndSettle();

      expect(find.byKey(const ValueKey('btnAdd')), findsOneWidget);
      await tester.tap(find.byKey(const ValueKey('btnAdd')));
      await Future.delayed(Duration(seconds: 2));
      expect(find.byKey(const ValueKey('input')), findsOneWidget);
      await tester.enterText(find.byKey(ValueKey('input')), ('teste'));
      await tester.tap(find.byKey(const ValueKey('BtnCriar')));
      await Future.delayed(Duration(seconds: 3));
      expect(find.byKey(const ValueKey('card')), findsOneWidget);
      expect(find.text('teste'), findsWidgets);
      expect(find.text('0/0'), findsOneWidget);
      await tester.tap(find.byKey(ValueKey('card')));
      await tester.pumpAndSettle();
      await Future.delayed(Duration(seconds: 3));
      await tester.tap(find.text('Adicionar'));
      await Future.delayed(Duration(seconds: 3));
      expect(find.text('Adicionar item'), findsOneWidget);
      await tester.enterText(find.byKey(ValueKey('inputitem')), ('itemteste'));
      await tester.enterText(find.byKey(ValueKey('inputvalor')), ('555'));
      await tester.tap(find.byKey(const ValueKey('BtnAdicionar')));
      await Future.delayed(Duration(seconds: 3));
      await tester.pumpAndSettle();
      expect(find.text('itemteste'), findsOneWidget);
      expect(find.textContaining("R\$ 5,55"), findsWidgets);
      
   results.last.aproved = true;
    });

    testWidgets('Validação de modal',
        (tester) async {
           results.add(TestResult(title: 'Validação de modal', aproved: false));
      app.main();
      await tester.pumpAndSettle();

      expect(find.byKey(const ValueKey('btnAdd')), findsOneWidget);
      await tester.tap(find.byKey(const ValueKey('btnAdd')));
      await Future.delayed(Duration(seconds: 2));
      expect(find.byKey(const ValueKey('input')), findsOneWidget);
      await tester.enterText(find.byKey(ValueKey('input')), ('teste'));
      await tester.tap(find.byKey(const ValueKey('BtnCriar')));
      await Future.delayed(Duration(seconds: 3));
      expect(find.byKey(const ValueKey('card')), findsOneWidget);
      expect(find.text('teste'), findsWidgets);
      expect(find.text('0/0'), findsOneWidget);
      await tester.tap(find.byKey(ValueKey('card')));
      await tester.pumpAndSettle();
      await Future.delayed(Duration(seconds: 3));
      await tester.tap(find.text('Adicionar'));
      await Future.delayed(Duration(seconds: 3));
      expect(find.text('Adicionar item'), findsOneWidget);
      await tester.tap(find.byIcon(Icons.close));
      await tester.pumpAndSettle();
      expect(find.text('Adicionar item'), findsNothing);
      
   results.last.aproved = true;
    });

    testWidgets('Validação funcional do checkbox',
        (tester) async {
           results.add(TestResult(title: 'Validação funcional do checkbox', aproved: false));
      app.main();
      await tester.pumpAndSettle();

      expect(find.byKey(const ValueKey('btnAdd')), findsOneWidget);
      await tester.tap(find.byKey(const ValueKey('btnAdd')));
      await Future.delayed(Duration(seconds: 2));
      expect(find.byKey(const ValueKey('input')), findsOneWidget);
      await tester.enterText(find.byKey(ValueKey('input')), ('teste'));
      await tester.tap(find.byKey(const ValueKey('BtnCriar')));
      await Future.delayed(Duration(seconds: 3));
      expect(find.byKey(const ValueKey('card')), findsOneWidget);
      expect(find.text('teste'), findsWidgets);
      expect(find.text('0/0'), findsOneWidget);
      await tester.tap(find.byKey(ValueKey('card')));
      await tester.pumpAndSettle();
      await Future.delayed(Duration(seconds: 3));
      await tester.tap(find.text('Adicionar'));
      await Future.delayed(Duration(seconds: 3));
      expect(find.text('Adicionar item'), findsOneWidget);
      await tester.enterText(find.byKey(ValueKey('inputitem')), ('itemteste'));
      await tester.enterText(find.byKey(ValueKey('inputvalor')), ('555'));
      await tester.tap(find.byKey(const ValueKey('BtnAdicionar')));
      await Future.delayed(Duration(seconds: 3));
      await tester.pumpAndSettle();
      expect(find.text('itemteste'), findsOneWidget);
      expect(find.textContaining("R\$ 5,55"), findsWidgets);
      await tester.tap(find.byKey(const ValueKey('checkbox')));
      await Future.delayed(Duration(seconds: 3));
      await tester.tap(find.byKey(const ValueKey('atualizar')));
      await Future.delayed(Duration(seconds: 2));
      await tester.pumpAndSettle();
      expect(find.text('1/1'), findsOneWidget);
   results.last.aproved = true;
    });

    testWidgets('Deletando lista',
        (tester) async {
           results.add(TestResult(title: 'Deletando lista', aproved: false));
      app.main();
      await tester.pumpAndSettle();

      expect(find.byKey(const ValueKey('btnAdd')), findsOneWidget);
      await tester.tap(find.byKey(const ValueKey('btnAdd')));
      await Future.delayed(Duration(seconds: 2));
      expect(find.byKey(const ValueKey('input')), findsOneWidget);
      await tester.enterText(find.byKey(ValueKey('input')), ('teste'));
      await tester.tap(find.byKey(const ValueKey('BtnCriar')));
      await Future.delayed(Duration(seconds: 3));
      expect(find.byKey(const ValueKey('card')), findsOneWidget);
      expect(find.text('teste'), findsWidgets);
      expect(find.text('0/0'), findsOneWidget);
      await Future.delayed(Duration(seconds: 3));
      await tester.longPress(find.byKey(ValueKey('card')));
      await tester.pumpAndSettle();
      expect(find.byKey(ValueKey('card')), findsNothing);
   results.last.aproved = true;
    });

    testWidgets('Verificando icones',
        (tester) async {
           results.add(TestResult(title: 'Verificando icones', aproved: false));
      app.main();
      await tester.pumpAndSettle();

      expect(find.byKey(const ValueKey('btnAdd')), findsOneWidget);
      await tester.tap(find.byIcon(Icons.diamond));
   results.last.aproved = true;
    });
  });

}

