import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

AppBar header(context, {removeBackbutton = false}) {
  return AppBar(
    title: Text(
      'PawnBook',
      style: TextStyle(fontFamily: "ShortBaby"),
    ),
  );
}

void main() {
  testWidgets('Header test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(appBar: header(tester))));
    expect(find.text('PawnBook'), findsOneWidget);
  });
}
