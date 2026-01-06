import 'package:flutter_test/flutter_test.dart';
import 'package:qleanfeel_app/core/app/app.dart';

void main() {
  testWidgets('App builds', (WidgetTester tester) async {
    await tester.pumpWidget(const App());
    expect(find.text('Login Page'), findsOneWidget);
  });
}