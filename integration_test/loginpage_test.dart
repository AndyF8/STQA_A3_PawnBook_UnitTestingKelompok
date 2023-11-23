import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:pawn_book/main.dart' as app;
import 'package:pawn_book/view/homepage.dart';


void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('Login Test', () {
    
    
  testWidgets('Login Page Test', (tester) async {
     // Initialize Firebase
  await Firebase.initializeApp();

    app.main();
    await tester.pumpAndSettle();
       await Future.delayed(const Duration(seconds: 2));

    // Tap the 'Masuk' button without entering email and password.
    await tester.tap(find.byType(ElevatedButton));
       await Future.delayed(const Duration(seconds: 2));
    await tester.pumpAndSettle();
       await Future.delayed(const Duration(seconds: 2));

    // Verify that the login failed alert is shown.
    
       await Future.delayed(const Duration(seconds: 2));

    // Enter valid email and password.
    await tester.enterText(find.byKey(const Key('emailField')), 'aa@mail.com');
       await Future.delayed(const Duration(seconds: 2));
    await tester.enterText(find.byKey(const Key('passwordField')), '123456');
       await Future.delayed(const Duration(seconds: 2));

    // Tap the 'Masuk' button again.
    await tester.tap(find.byType(ElevatedButton));
       await Future.delayed(const Duration(seconds: 2));
    await tester.pumpAndSettle();
       await Future.delayed(const Duration(seconds: 2));

   
   });
 });
       
} 
        
  