import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:pawn_book/main.dart' as app;
import 'package:pawn_book/view/add_daftarbuku.dart';
import 'package:pawn_book/view/daftarbuku.dart';



void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  
 group('daftar buku test', () {
     
  testWidgets("Integration Test for DaftarBuku", (tester) async {
    await Firebase.initializeApp();
    // Build our app and trigger a frame.
    app.main();

    // Wait for the app to finish rendering.
    await tester.pumpAndSettle();
     await Future.delayed(const Duration(seconds: 2));

    // Your integration test logic goes here.
    // For example, you can interact with widgets and verify their states.

    // Example: Tap on the FloatingActionButton to add a new book.
    await tester.tap(find.byType(FloatingActionButton));
     await Future.delayed(const Duration(seconds: 2));
    await tester.pumpAndSettle();
     await Future.delayed(const Duration(seconds: 2));

    // Example: Verify if the "AddBuku" screen is displayed.
     expect(find.byType(AddBuku), findsOneWidget);
     await Future.delayed(const Duration(seconds: 2));

      await tester.tap(find.byIcon(Icons.arrow_back));
    await Future.delayed(const Duration(seconds: 2));
    await tester.pumpAndSettle();
    await Future.delayed(const Duration(seconds: 2));

    expect(find.byType(DaftarBuku), findsOneWidget);
    await Future.delayed(const Duration(seconds: 2));
  

  });
 });
       
} 