// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:dog_ceo_example/di/di_api_module.dart' as _i11;
import 'package:dog_ceo_example/di/di_app_module.dart' as _i12;
import 'package:dog_ceo_example/domain/api/api.dart' as _i7;
import 'package:dog_ceo_example/navigation/navigator.dart' as _i8;
import 'package:dog_ceo_example/navigation/router/router.dart' as _i4;
import 'package:dog_ceo_example/presentation/breed_details/bloc/breed_details_bloc.dart'
    as _i9;
import 'package:dog_ceo_example/presentation/breeds_list/bloc/breeds_list_bloc.dart'
    as _i10;
import 'package:dog_ceo_example/util/launcher.dart' as _i6;
import 'package:flutter/material.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

const String _prod = 'prod';
const String _dev = 'dev';
const String _test = 'test';

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dIApiModule = _$DIApiModule();
    final dIAppModule = _$DIAppModule();
    gh.lazySingleton<_i3.Dio>(() => dIApiModule.createDio());
    gh.lazySingleton<_i4.DogCeoRouter>(() => _i4.DogCeoRouter());
    gh.lazySingleton<_i5.GlobalKey<_i5.NavigatorState>>(() => dIAppModule.key);
    gh.factory<_i6.Launcher>(() => const _i6.Launcher());
    gh.factory<String>(
      () => dIApiModule.baseUrl,
      instanceName: 'DogBreedsBaseUrl',
      registerFor: {
        _prod,
        _dev,
      },
    );
    gh.factory<String>(
      () => dIApiModule.testBaseUrl,
      instanceName: 'DogBreedsBaseUrl',
      registerFor: {_test},
    );
    gh.factory<_i7.DogBreedApi>(() => _i7.DogBreedApi(
          gh<_i3.Dio>(),
          baseUrl: gh<String>(instanceName: 'DogBreedsBaseUrl'),
        ));
    gh.factory<_i8.DogCeoNavigator>(
        () => _i8.DogCeoNavigator(gh<_i4.DogCeoRouter>()));
    gh.factoryParam<_i9.BreedDetailsBloc, String, dynamic>((
      _breedId,
      _,
    ) =>
        _i9.BreedDetailsBloc(
          gh<_i7.DogBreedApi>(),
          _breedId,
        ));
    gh.factory<_i10.BreedsListBloc>(() => _i10.BreedsListBloc(
          gh<_i7.DogBreedApi>(),
          gh<_i8.DogCeoNavigator>(),
        ));
    return this;
  }
}

class _$DIApiModule extends _i11.DIApiModule {}

class _$DIAppModule extends _i12.DIAppModule {}
