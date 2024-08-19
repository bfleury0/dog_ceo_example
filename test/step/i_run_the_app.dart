import 'package:dog_ceo_example/app.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> iRunTheApp(WidgetTester tester) async {
  await tester.pumpWidget(const DogCeoApp());
  await tester.pumpAndSettle();
}
