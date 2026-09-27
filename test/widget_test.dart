import 'package:animal_app/main.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
    FlutterSecureStorage.setMockInitialValues({});
  });

  testWidgets('shows login page after bootstrap', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));

    expect(find.text('Log In'), findsWidgets);
    expect(find.text('ANIMOOO'), findsOneWidget);
    expect(find.text('Forget Password....?'), findsOneWidget);
    expect(
      find.textContaining('Sign up now', findRichText: true),
      findsOneWidget,
    );
  });
}
