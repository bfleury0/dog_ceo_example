import 'package:dog_ceo_example/di/di_initializer.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

@injectableInit
GetIt initDI(GetIt getIt, String environment) =>
    getIt.init(environment: environment);
