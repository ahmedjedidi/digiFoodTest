// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:io';

import 'package:digifood_test/data/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:get/get.dart';
import 'package:mockito/mockito.dart';

import 'mock_app_page.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  final listProducts = [
    Product(
        id: "id",
        title: "title1",
        description: "description",
        price: 300,
        imageUrl:
            "https://firebasestorage.googleapis.com/v0/b/androidecommercesample.appspot.com/o/playstation_1.png?alt=media&token=1414f40e-23cf-4f44-b922-e12bfcfca9f3"),
    Product(
        id: "id",
        title: "title2",
        description: "description",
        price: 300,
        imageUrl:
            "https://firebasestorage.googleapis.com/v0/b/androidecommercesample.appspot.com/o/playstation_1.png?alt=media&token=1414f40e-23cf-4f44-b922-e12bfcfca9f3")
  ];

  setUpAll(() {
    // ↓ required to avoid HTTP error 400 mocked returns
    HttpOverrides.global = null;
  });

  testWidgets('Product view testwidget', (WidgetTester tester) async {
    final mockObserver = MockNavigatorObserver();
    await tester.pumpWidget(
      GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Digi Food Test",
        initialRoute: MockAppPages.INITIAL,
        getPages: MockAppPages.routes,
        navigatorObservers: [mockObserver],
      ),
    );

    // Verify initialx configuration
    expect(find.byKey(const Key('ProductView')), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    await tester.pump(const Duration(seconds: 3));
    //verify data is displayed and loader is hided
    for (final product in listProducts) {
      expect(find.text(product.title), findsOneWidget);
    }
    expect(find.byType(CircularProgressIndicator), findsNothing);
  });

    testWidgets('search product test', (WidgetTester tester) async {
    await tester.pumpWidget(
      GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Digi Food Test",
        initialRoute: MockAppPages.INITIAL,
        getPages: MockAppPages.routes,
      ),
    );
    await tester.pumpAndSettle();
    // Verify initialx configuration
    expect(find.byType(TextFormField),findsOneWidget);
    expect(find.text('title2'), findsOneWidget);
    // Tap title1 in searchbar 
    await tester.enterText(find.byType(TextFormField), 'title1');
    // refrech widget
    await tester.pumpAndSettle();
    //title2 is hided 
    expect(find.text('title2'), findsNothing);


  });
}
