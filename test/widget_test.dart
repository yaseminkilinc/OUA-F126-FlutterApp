import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:bmi_calculator_app/main.dart';

void main() {
  testWidgets('BMI Calculator test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(home: BMICalculator()));

    // Verify that height and weight text fields exist.
    expect(find.byType(TextField), findsNWidgets(2));

    // Enter test values for height and weight.
    await tester.enterText(find.byType(TextField).at(0), '170');
    await tester.enterText(find.byType(TextField).at(1), '70');

    // Tap the 'Calculate BMI' button and trigger a frame.
    await tester.tap(find.text('Calculate BMI'));
    await tester.pump();

    // Verify that BMI and advice texts are displayed with correct values.
    expect(find.text('Your BMI: 24.22'), findsOneWidget);
    expect(find.text('Recommendation: Normal weight'), findsOneWidget);
  });
}



