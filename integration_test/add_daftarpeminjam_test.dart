import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:pawn_book/main.dart' as app;
import 'package:pawn_book/view/homepage.dart';


void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  
 group('add daftar peminjam_test', () {
   testWidgets('Daily Report Page Integration Test', (tester) async {
     await Firebase.initializeApp();
  // Build our app and trigger a frame.
    app.main();

    await tester.pumpAndSettle();
    await Future.delayed(const Duration(seconds: 2));
    // Enter data into the form fields.
     await tester.enterText(find.byType(TextFormField).at(0), "dor");
    await Future.delayed(const Duration(seconds: 2));

    await tester.tap(find.byType(DropdownButton));
       await Future.delayed(const Duration(seconds: 2));

    // Assume the first item in the dropdown list is selected.
    await tester.tap(find.text('Relung Waktu'));
    await Future.delayed(const Duration(seconds: 2));
    // Assume the selected book has a known author.
    expect(find.text('Dede Pratiwi'), findsOneWidget);
    await Future.delayed(const Duration(seconds: 2));
    await tester.tap(find.byKey(const Key('tglpinjam')));
    await Future.delayed(const Duration(seconds: 2));
    await tester.pump();
   await Future.delayed(const Duration(seconds: 2));
    // Assume today's date is selected.
    await tester.tap(find.text('OK'));
    await Future.delayed(const Duration(seconds: 2));
    await tester.pump();
    await Future.delayed(const Duration(seconds: 2));

    await tester.tap(find.byKey(const Key('tglkembali')));
    await Future.delayed(const Duration(seconds: 2));
    await tester.pump();
    await Future.delayed(const Duration(seconds: 2));
    // Assume a date in the future is selected.
    await tester.tap(find.text('OK'));
    await Future.delayed(const Duration(seconds: 2));
    await tester.pump();
    await Future.delayed(const Duration(seconds: 2));

    // Tap the save button.
    await tester.tap(find.byType(ElevatedButton));
    await Future.delayed(const Duration(seconds: 2));
    await tester.pump();
    await Future.delayed(const Duration(seconds: 2));

    // Wait for the snackbar to appear.
    await tester.pumpAndSettle();
    await Future.delayed(const Duration(seconds: 2));

    
    // Verify that the user is navigated to the home page.
    expect(find.byType(HomePage), findsOneWidget);
  });
 });
}