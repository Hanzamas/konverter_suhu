// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:konverter_suhu/main.dart';

void main() {
  testWidgets('Temperature converter test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that we have the temperature converter UI elements
    expect(find.text('Konverter Suhu'), findsOneWidget);
    expect(find.text('Masukkan Suhu dalam Celsius:'), findsOneWidget);
    expect(find.text('Hasil Konversi:'), findsOneWidget);
    expect(find.text('Fahrenheit:'), findsOneWidget);
    expect(find.text('Kelvin:'), findsOneWidget);

    // Find the text field and enter a value
    final textField = find.byType(TextField);
    await tester.enterText(textField, '25');
    await tester.pump();

    // Tap the convert button
    await tester.tap(find.text('Konversi'));
    await tester.pump();

    // Verify that conversion results are displayed
    expect(find.text('77.00°F'), findsOneWidget);
    expect(find.text('298.15 K'), findsOneWidget);
  });
}
