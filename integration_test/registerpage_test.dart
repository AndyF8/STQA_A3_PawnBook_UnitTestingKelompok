import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:pawn_book/main.dart' as app; // Replace with your app's entry file
import 'package:pawn_book/view/registerpage.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

    group('register test', 
    () { 

      testWidgets('Test registration functionality', (tester) async {
      await Firebase.initializeApp();
       app.main(); // Replace with your app's entry point

       await tester.pumpAndSettle(); // Wait for the app to load
       await Future.delayed(const Duration(seconds: 2));

       // Your test logic goes here
       // For example, enter name, email, password, tap the register button, and check the result
      await tester.enterText(find.byType(TextField).at(0), 'John Doe');
      await Future.delayed(const Duration(seconds: 2));
      await tester.enterText(find.byType(TextField).at(1), 'jhon@gmail.com');
      await Future.delayed(const Duration(seconds: 2));
      await tester.enterText(find.byType(TextField).at(2), 'password123');
      await Future.delayed(const Duration(seconds: 2));

      await tester.tap(find.byType(ElevatedButton));
      await Future.delayed(const Duration(seconds: 2));
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));
    

      // Check if the registration was successful
      
    });
   } 
 );
}
