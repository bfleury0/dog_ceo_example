import 'package:dog_ceo_example/presentation/breeds_list/breeds_list_page.dart';
import 'package:dog_ceo_example/presentation/breed_details/breed_details_page.dart';

Feature: Breeds list

  Background:
    Given di is initialized

  Scenario: Breeds list first loading succeeded
    Given API is mocked to succeed
    And I run the app
    Then I see {'Dog Ceo Example'} text
    And I see {'affenpinscher'} text

  Scenario: Breed details open on tap
    Given API is mocked to succeed
    And I run the app
    When I tap {'affenpinscher'} text
    And I wait
    Then I see {BreedDetailsPage} widget