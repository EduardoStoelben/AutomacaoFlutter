import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mercado_livre/stores/shopping_cart.store.dart';

import '../lib/main.dart' as app;
import 'json.dart';


GetIt getIt = GetIt.instance;
void main() {
  
final List<TestResult> results = [];

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  tearDown(() async {
    await Future.delayed(Duration(seconds: 2));
    getIt.reset(dispose: true);
  });
  tearDownAll(() => enviarDadosComoJson(results));
    group('Validação da tela principal', () {
    testWidgets('Validação da lupa da barra de pesquisa',
        (tester) async {
           results.add(TestResult(title: 'Validação da lupa da barra de pesquisa', aproved: false));
      app.main();
      await tester.pumpAndSettle();
      expect(find.byIcon(Icons.search), findsOneWidget);
   results.last.aproved = true;
    });

    testWidgets('Validação da barra de pesquisa',
        (tester) async {
           results.add(TestResult(title: 'Validação da barra de pesquisa', aproved: false));
      app.main();
      await tester.pumpAndSettle();
      expect(find.byKey(ValueKey('inputsearch')), findsOneWidget);
   results.last.aproved = true;
    });

    testWidgets('Validação do carrinho de compras',
        (tester) async {
           results.add(TestResult(title: 'Validação do carrinhos de compras', aproved: false));
      app.main();
      await tester.pumpAndSettle();
      expect(find.byIcon(Icons.shopping_cart_outlined), findsOneWidget);

   results.last.aproved = true;
    });
    
    testWidgets('Validação do icone do cep',
        (tester) async {
           results.add(TestResult(title: 'Validação do icone do cep', aproved: false));
      app.main();
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.pin_drop_outlined), findsOneWidget);

   results.last.aproved = true;
    });

    testWidgets('Validação do texto do cep',
        (tester) async {
           results.add(TestResult(title: 'Validação do texto do cep', aproved: false));
      app.main();
      await tester.pumpAndSettle();

      expect(find.text('Informe o seu cep'), findsOneWidget);

   results.last.aproved = true;
    });

    testWidgets('Validação da seta ao lado do cep',
        (tester) async {
           results.add(TestResult(title: 'Validação da seta ao lado do cep', aproved: false));
      app.main();
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.arrow_forward_ios), findsOneWidget);

   results.last.aproved = true;
    });

    testWidgets('Validação do texto de resultados',
        (tester) async {
           results.add(TestResult(title: 'Validação do texto de resultados', aproved: false));
      app.main();
      await tester.pumpAndSettle();

      expect(find.text('15 resultados'), findsOneWidget);

   results.last.aproved = true;
    });

    testWidgets('Validação do botão filtrar',
        (tester) async {
           results.add(TestResult(title: 'Validação do botão filtrar', aproved: false));
      app.main();
      await tester.pumpAndSettle();

      expect(find.text('Filtrar (2)'), findsOneWidget);
      await tester.tap(find.text('Filtrar (2)'));

   results.last.aproved = true;
    });

    testWidgets('Validação da imagem do card',
        (tester) async {
           results.add(TestResult(title: 'Validação da imagem do card', aproved: false));
      app.main();
      await tester.pumpAndSettle();

      expect(find.byKey(ValueKey('image')), findsWidgets);

   results.last.aproved = true;
    });

    testWidgets('Validação do nome do produto no card',
        (tester) async {
           results.add(TestResult(title: 'Validação do nome do produto no card', aproved: false));
      app.main();
      await tester.pumpAndSettle();

      expect(find.text('Apple Iphone 11 Pro (128gb) - Preto'), findsWidgets);

   results.last.aproved = true;
    });

    testWidgets('Validação do preço do produto no card',
        (tester) async {
           results.add(TestResult(title: 'Validação do preço do produto no card', aproved: false));
      app.main();
      await tester.pumpAndSettle();

      expect(find.text('R\$ 599.99'), findsWidgets);

   results.last.aproved = true;
    });

    testWidgets('Validação do parcelamento do produto no card',
        (tester) async {
           results.add(TestResult(title: 'Validação do parcelamento do produto no card', aproved: false));
      app.main();
      await tester.pumpAndSettle();

      expect(find.text('em 10x R\$ 60.00 sem juros'), findsWidgets);

   results.last.aproved = true;
    });

    testWidgets('Validação do frete do produto no card',
        (tester) async {
           results.add(TestResult(title: 'Validação do frete do produto no card', aproved: false));
      app.main();
      await tester.pumpAndSettle();

      expect(find.text('Frete grátis'), findsWidgets);

   results.last.aproved = true;
    });

    testWidgets('Validação da cor do produto no card',
        (tester) async {
           results.add(TestResult(title: 'Validação da cor do produto no card', aproved: false));
      app.main();
      await tester.pumpAndSettle();

      expect(find.text('Disponível em 6 cores'), findsWidgets);

   results.last.aproved = true;
    });

    testWidgets('Validação do icone estrela no card',
        (tester) async {
           results.add(TestResult(title: 'Validação do icone estrela no card', aproved: false));
      app.main();
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.star), findsWidgets);
      await tester.tap(find.byIcon(Icons.star).first);

   results.last.aproved = true;
    });

    testWidgets('Validação do botão add no card',
        (tester) async {
           results.add(TestResult(title: 'Validação do botão add no card', aproved: false));
      app.main();
      await tester.pumpAndSettle();

      expect(find.byKey(Key('add')), findsWidgets);
      final cardFinder = find.byKey(Key('add')).first;
      await tester.tap(cardFinder);
      expect(GetIt.I.get<ShoppingCartStore>().productsInCart.length, 1);
   results.last.aproved = true;
    });

    testWidgets('Validação da tela do carrinho',
        (tester) async {
           results.add(TestResult(title: 'Validação da tela do carrinho', aproved: false));
      app.main();
      await tester.pumpAndSettle();

      expect(GetIt.I.get<ShoppingCartStore>().productsInCart.length, 0);
      expect(find.byIcon(Icons.shopping_cart_outlined), findsOneWidget);
      await tester.tap(find.byIcon(Icons.shopping_cart_outlined));
      await Future.delayed(Duration(seconds: 2));
      await tester.pumpAndSettle();
      expect(find.byKey(Key('imagecart')), findsOneWidget);
      expect(find.text('Carrinho de compras'), findsOneWidget);
   results.last.aproved = true;
    });

    testWidgets('Validação de noticações ao adicionar no carrinho',
        (tester) async {
           results.add(TestResult(title: 'Validação de noticações ao adicionar no carrinho', aproved: false));
      app.main();
      await tester.pumpAndSettle();

      expect(find.byKey(Key('add')), findsWidgets);

      final cardFinder = find.byKey(Key('add')).first;
      await tester.tap(cardFinder);
      await Future.delayed(Duration(seconds: 2));
      expect(find.text('Produto adicionado!'),findsOneWidget);

   results.last.aproved = true;
    });

    testWidgets('Validação de noticações ao adicionar repetido no carrinho',
        (tester) async {
           results.add(TestResult(title: 'Validação de noticações ao adicionar repetido no carrinho', aproved: false));
      app.main();
      await tester.pumpAndSettle();

      expect(find.byKey(Key('add')), findsWidgets);

      final cardFinder = find.byKey(Key('add')).first;
      await tester.tap(cardFinder);
      await Future.delayed(Duration(seconds: 1));
      expect(find.text('Produto adicionado!'),findsOneWidget);
      await Future.delayed(Duration(seconds: 2));
      await tester.tap(find.byIcon(Icons.shopping_cart_outlined));
      await Future.delayed(Duration(seconds: 2));
      await tester.pumpAndSettle();
      expect(find.byKey(Key('btnvoltar')), findsOneWidget);
      await tester.tap(find.byKey(Key('btnvoltar')));
      await Future.delayed(Duration(seconds: 2));
      await tester.pumpAndSettle();
      await tester.tap(cardFinder);
      await tester.pumpAndSettle();
      await Future.delayed(Duration(seconds: 2));
      expect(find.text('Produto não adicionado!'),findsOneWidget);
   results.last.aproved = true;
    });

    testWidgets('Validação de noticações ao adicionar no carrinho',
        (tester) async {
           results.add(TestResult(title: 'Validação de noticações ao adicionar no carrinho', aproved: false));
      app.main();
      await tester.pumpAndSettle();

      expect(find.byKey(Key('add')), findsWidgets);

      //final cardIndex = 0; // Substitua pelo índice do card desejado
      final cardFinder = find.byKey(Key('add')).first;
      await tester.tap(cardFinder);
      await Future.delayed(Duration(seconds: 1));
      expect(find.text('Produto adicionado!'),findsOneWidget);
      await tester.tap(find.byIcon(Icons.shopping_cart_outlined));
      await Future.delayed(Duration(seconds: 2));
      await tester.pumpAndSettle();
      expect(find.byKey(Key('imagecart')), findsNothing);
      expect(find.text('0 - Apple Iphone 11 Pro (128gb) - Preto - 599.99'), findsOneWidget);

   results.last.aproved = true;
    });
  
  });

}