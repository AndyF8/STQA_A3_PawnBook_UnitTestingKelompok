import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pawn_book/controller/peminjam_controller.dart';
import 'package:pawn_book/model/peminjam_model.dart'; // Adjust the import path as needed

Future <void> main() async {
  // Initialize Firebase
  TestWidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  group('PeminjamController Tests', () {
    late PeminjamController controller;

    setUp(() {
      controller = PeminjamController();
    });

    test('Add Peminjam', () async {
      PeminjamModel peminjamModel = PeminjamModel(
        namapeminjam: 'John Doe',
        selectedBuku: 'Book Title',
        pengarang: 'Author',
        tglpinjam: '2023-11-16', // String representation of a date
        tglkembali: '2023-11-23', // String representation of a date
      );

      await controller.addPeminjam(peminjamModel);

      var result = await controller.getPinjam();

      expect(result, isNotEmpty);
    });

    test('Update Peminjam', () async {
      // Assuming there is at least one Peminjam in the database to update
      PeminjamModel peminjamModel = PeminjamModel(
        pid: 'your_peminjam_id_here',
        namapeminjam: 'Updated Name',
        selectedBuku: 'Updated Book Title',
        pengarang: 'Updated Author',
        tglpinjam: '2023-11-16', // String representation of a date
        tglkembali: '2023-11-30', // String representation of a date
      );

      await controller.updatePeminjam(peminjamModel);

      var result = await controller.getPinjam();

      expect(result, isNotEmpty);
    });

    test('Remove Peminjam', () async {
      // Assuming there is at least one Peminjam in the database to remove
      String peminjamId = 'your_peminjam_id_here';

      await controller.removePeminjam(peminjamId);

      var result = await controller.getPinjam();

      expect(result, isEmpty);
    });
  });
}
