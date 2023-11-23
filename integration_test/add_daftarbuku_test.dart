import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:pawn_book/main.dart' as app;
import 'package:pawn_book/controller/buku_controller.dart';
import 'package:pawn_book/model/buku_model.dart';
import 'package:pawn_book/view/daftarbuku.dart';


void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  
 group('add daftar buku_test', () {
    
   testWidgets("Test AddBuku Screen", (WidgetTester tester) async {
    await Firebase.initializeApp();
    app.main(); // Assuming your main entry point is in the main.dart file

    // Wait for the app to fully render
    await tester.pumpAndSettle();
       await Future.delayed(const Duration(seconds: 2));

     // Fill in the form fields
    await tester.enterText(find.byType(TextFormField).at(0), "Test Judul");
    await Future.delayed(const Duration(seconds: 2));
    await tester.enterText(find.byType(TextFormField).at(1), "Test Pengarang");
    await Future.delayed(const Duration(seconds: 2));
    await tester.enterText(find.byType(TextFormField).at(2), "Test Penerbit");
    await Future.delayed(const Duration(seconds: 2));
       
    // Select a value from the dropdown
    await tester.tap(find.byType(DropdownButton));
       await Future.delayed(const Duration(seconds: 2));
    await tester.pumpAndSettle();
       await Future.delayed(const Duration(seconds: 2));
    await tester.tap(find.text("Dipinjam").last);
       await Future.delayed(const Duration(seconds: 2));
    await tester.pumpAndSettle();
       await Future.delayed(const Duration(seconds: 2));

    // Tap the "Simpan" button
    await tester.tap(find.byType(ElevatedButton));
       await Future.delayed(const Duration(seconds: 2));
    await tester.pumpAndSettle();
       await Future.delayed(const Duration(seconds: 2));


    // Check if the navigation back to DaftarBuku screen occurs
    expect(find.byType(DaftarBuku), findsOneWidget);
       await Future.delayed(const Duration(seconds: 2));
  });
 });
}