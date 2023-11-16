import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pawn_book/controller/auth_controller.dart';
import 'package:firebase_core/firebase_core.dart';

Future <void> main() async {
  // Initialize Firebase before using FirebaseFirestore
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  group('AuthController', () {
    final authController = AuthController();

    test('signInWithEmailAndPassword', () async {
      final user = await authController.signInWithEmailAndPassword(
          'test@example.com', 'password');
      expect(user, isNotNull);
    });

    test('registerWithEmailAndPassword', () async {
      final user = await authController.registerWithEmailAndPassword(
          'password ', 'test@example.com', 'password');
      expect(user, isNotNull);
    });

    test('getCurrentUser', () async {
      final user = authController.getCurrentUser();
      expect(user, isNotNull);
    });

    test('signOut', () async {
      await authController.signOut();
      expect(authController.getCurrentUser(), isNull);
    });
  });
}
