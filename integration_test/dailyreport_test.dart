import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:pawn_book/main.dart' as app;
import 'package:pawn_book/view/dailyreport.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  
 group('add daftar peminjam_test', () {
   testWidgets('Daily Report Page Integration Test', (tester) async {
     await Firebase.initializeApp();
  // Build our app and trigger a frame.
    app.main();
     await tester.pumpAndSettle(); // Wait for the app to settle
     await Future.delayed(const Duration(seconds: 2));

    // Example: Tap the calendar icon to select a date
    await tester.tap(find.byIcon(Icons.calendar_today));
    await Future.delayed(const Duration(seconds: 2));
    await tester.pumpAndSettle();
    await Future.delayed(const Duration(seconds: 2));

    // Example: Verify that the date picker dialog is open
    expect(find.byType(DatePickerDialog), findsOneWidget);
    await Future.delayed(const Duration(seconds: 2));

    // Example: Select a date in the date picker dialog
    await tester.tap(find.text('OK'));
    await Future.delayed(const Duration(seconds: 2));
    await tester.pumpAndSettle();
    await Future.delayed(const Duration(seconds: 2));

    // Example: Verify that the date is updated in the Daily Report Page
    expect(find.byType(DailyReportPage), findsOneWidget);
    await Future.delayed(const Duration(seconds: 2));
    // Add more test scenarios based on your application flow

  });
 });
}



