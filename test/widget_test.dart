// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_1/main.dart';

void main() {
  testWidgets('Login flow navigates to dashboard', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Login'), findsOneWidget);
    expect(find.text('Login Dah'), findsOneWidget);
    expect(find.byIcon(Icons.person), findsOneWidget);

    await tester.enterText(find.byType(TextField).first, 'Budi');
    await tester.enterText(find.byType(TextField).last, '12345');
    await tester.tap(find.text('Login Dah'));
    await tester.pumpAndSettle();

    expect(find.text('Hello, Budi'), findsOneWidget);
    expect(find.text('Daftar Aktivitas Hari Ini'), findsOneWidget);
    expect(find.byIcon(Icons.logout), findsOneWidget);
  });
}
