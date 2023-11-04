import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:login/main.dart';

void main() {
  testWidgets('Test Login Page Widgets', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: HomePage(),
    ));

    // Verify that the Login text is displayed.
    expect(find.text('Login'), findsOneWidget);

    // Verify that the "Email or Phone number" TextField is present.
    expect(find.widgetWithText(TextField, 'Email or Phone number'),
        findsOneWidget);

    // Verify that the "Password" TextField is present.
    expect(find.widgetWithText(TextField, 'Password'), findsOneWidget);

    // Verify that the "Login" button is present.
    expect(find.widgetWithText(MaterialButton, 'Login'), findsOneWidget);

    // Verify that the "Forgot Password?" text is present.
    expect(find.text('Forgot Password?'), findsOneWidget);
  });
}
