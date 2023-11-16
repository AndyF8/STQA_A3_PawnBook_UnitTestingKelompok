import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pawn_book/view/profile.dart';

void main() {
  testWidgets('Profile Widget Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: Profile(),
      ),
    );

    // Verify that the Profile widget contains a Placeholder widget.
    expect(find.byType(Profile), findsOneWidget);
    expect(find.byType(Placeholder), findsOneWidget);
  });
}