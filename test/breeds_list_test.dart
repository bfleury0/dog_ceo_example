// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:dog_ceo_example/presentation/breeds_list/breeds_list_page.dart';
import 'package:dog_ceo_example/presentation/breed_details/breed_details_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/di_is_initialized.dart';
import './step/api_is_mocked_to_succeed.dart';
import './step/i_run_the_app.dart';
import './step/i_see_text.dart';
import './step/i_tap_text.dart';
import './step/i_wait.dart';
import './step/i_see_widget.dart';

void main() {
  group('''Breeds list''', () {
    Future<void> bddSetUp(WidgetTester tester) async {
      await diIsInitialized(tester);
    }

    testWidgets('''Breeds list first loading succeeded''', (tester) async {
      await bddSetUp(tester);
      await apiIsMockedToSucceed(tester);
      await iRunTheApp(tester);
      await iSeeText(tester, 'Dog Ceo Example');
      await iSeeText(tester, 'affenpinscher');
    });
    testWidgets('''Breed details open on tap''', (tester) async {
      await bddSetUp(tester);
      await apiIsMockedToSucceed(tester);
      await iRunTheApp(tester);
      await iTapText(tester, 'affenpinscher');
      await iWait(tester);
      await iSeeWidget(tester, BreedDetailsPage);
    });
  });
}
