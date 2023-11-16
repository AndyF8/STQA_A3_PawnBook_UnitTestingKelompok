import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pawn_book/model/buku_model.dart';
import 'package:pawn_book/controller/buku_controller.dart';

Future <void> main() async {
  // Initialize Firebase before using FirebaseFirestore
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  group('BukuController', () {
    BukuController bukuController = BukuController();

    test('addBuku', () async {
      BukuModel bukuModel = BukuModel(
          bukuid: 'test-bukuid',
          judulbuku: 'Test Judul Buku',
          pengarangbuku: 'Test Pengarang Buku',
          penerbitbuku: 'Test Penerbit Buku',
          selectedValue: '1');

      await bukuController.addBuku(bukuModel);

      DocumentSnapshot documentSnapshot =
          await bukuController.bukucollection.doc('test-bukuid').get();

      expect(documentSnapshot.exists, true);
      expect(documentSnapshot.data(), bukuModel.toMap());
    });

    test('updateBuku', () async {
      BukuModel bukuModel = BukuModel(
          bukuid: 'test-bukuid',
          judulbuku: 'Updated Judul Buku',
          pengarangbuku: 'Updated Pengarang Buku',
          penerbitbuku: 'Updated Penerbit Buku',
          selectedValue: '2');

      await bukuController.updateBuku(bukuModel);

      DocumentSnapshot documentSnapshot =
          await bukuController.bukucollection.doc('test-bukuid').get();

      expect(documentSnapshot.exists, true);
      expect(documentSnapshot.data(), bukuModel.toMap());
    });

    test('removeBuku', () async {
      await bukuController.removeBuku('test-bukuid');

      DocumentSnapshot documentSnapshot =
          await bukuController.bukucollection.doc('test-bukuid').get();

      expect(documentSnapshot.exists, false);
    });

    test('getBuku', () async {
      Stream<List<DocumentSnapshot>> stream = bukuController.stream;

      expect(stream, isInstanceOf<Stream<List<DocumentSnapshot>>>());

      List<DocumentSnapshot> documents = await stream.first;
      expect(documents.length, 0);
    });
  });
}
