import 'package:dog_ceo_example/app.dart';
import 'package:dog_ceo_example/di/di_container.dart';
import 'package:dog_ceo_example/di/di_initializer.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

void main() {
  initDI(diContainer, Environment.prod);
  runApp(const DogCeoApp());
}
