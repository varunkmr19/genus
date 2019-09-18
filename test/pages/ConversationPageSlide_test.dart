import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:genus/pages/ConversationPage.dart';
import 'package:genus/pages/ConversationPageSlide.dart';
import 'package:genus/widgets/InputWidget.dart';

void main() {
  const MaterialApp app = MaterialApp(
    home: Scaffold(
      body: const ConversationPageSlide(),
    ),
  );
  testWidgets('ConversationPage UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(app);

    expect(find.byType(ConversationPage), findsOneWidget);
    expect(find.byType(PageView), findsOneWidget);
    expect(find.byType(InputWidget), findsOneWidget);
  });
}