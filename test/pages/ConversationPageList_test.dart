import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:genus/pages/ConversationPage.dart';
import 'package:genus/pages/ConversationPageSlide.dart';

void main() {
  const MaterialApp app = MaterialApp(
    home: Scaffold(
      body: ConversationPageSlide(),
    ),
  );
  testWidgets('ConversationPageSlide UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(app);
    expect(find.byType(ConversationPage), findsOneWidget);
    expect(find.byType(PageView), findsOneWidget);
  });
}