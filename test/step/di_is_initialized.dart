import 'package:dog_ceo_example/di/di_container.dart';
import 'package:dog_ceo_example/di/di_initializer.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:injectable/injectable.dart';

Future<void> diIsInitialized(WidgetTester tester) async {
  await diContainer.reset();
  initDI(diContainer, Environment.test);
}
