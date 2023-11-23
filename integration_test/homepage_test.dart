import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:pawn_book/main.dart' as app;
import 'package:pawn_book/view/add_daftarpeminjam.dart';
import 'package:pawn_book/view/homepage.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  
 group('homepage_test', () {
     
  testWidgets('Login Page Test', (tester) async {
     // Initialize Firebase
     await Firebase.initializeApp();
      app.main();
    await tester.pumpAndSettle();
    await Future.delayed(const Duration(seconds: 2));

   
    // Wait for the data to load.
    await tester.pumpAndSettle();
    await Future.delayed(const Duration(seconds: 2));


    // Tap the add button to navigate to the AddPeminjam page.
    await tester.tap(find.byIcon(Icons.add));
    await Future.delayed(const Duration(seconds: 2));
    await tester.pumpAndSettle();
    await Future.delayed(const Duration(seconds: 2));

    // Verify that the AddPeminjam page is displayed.
    expect(find.byType(AddPeminjam), findsOneWidget);
    await Future.delayed(const Duration(seconds: 2));

    // Navigate back to the HomePage.
    await tester.tap(find.byIcon(Icons.arrow_back));
    await Future.delayed(const Duration(seconds: 2));
    await tester.pumpAndSettle();
    await Future.delayed(const Duration(seconds: 2));
    // Verify that we are back on the HomePage.
    expect(find.byType(HomePage), findsOneWidget);
    await Future.delayed(const Duration(seconds: 2));

   });
 });
       
} 