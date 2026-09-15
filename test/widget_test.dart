import 'package:animal_app/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('shows login page after bootstrap', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));

    expect(find.text('Log In'), findsWidgets);
    expect(find.text('ANIMOOO'), findsOneWidget);
  });
}
