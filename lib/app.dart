import 'package:dog_ceo_example/di/di_container.dart';
import 'package:dog_ceo_example/navigation/router/router.dart';
import 'package:dog_ceo_example/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:barrel_files_annotation/barrel_files_annotation.dart';

@includeInBarrelFile
class DogCeoApp extends StatelessWidget {
  const DogCeoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: diContainer<DogCeoRouter>().config(),
      theme: Themes.lightTheme,
      themeMode: ThemeMode.system,
    );
  }
}
