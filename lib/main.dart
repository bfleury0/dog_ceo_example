import 'package:dog_ceo_example/bloc/breed_detail_bloc.dart';
import 'package:dog_ceo_example/bloc/breeds_bloc.dart';
import 'package:dog_ceo_example/custom_slide_transition.dart';
import 'package:dog_ceo_example/repositories/breeds_repo.dart';
import 'package:dog_ceo_example/theme_data.dart';
import 'package:dog_ceo_example/views/detail_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BreedsBloc>(
          create: (BuildContext context) => BreedsBloc(BreedsRepo()),
        ),
        BlocProvider<BreedDetailBloc>(
          create: (BuildContext context) => BreedDetailBloc(BreedsRepo()),
        ),
      ],
      child: MaterialApp.router(
        title: 'Dog Ceo example',
        theme: Themes.lightTheme,
        themeMode: ThemeMode.system,
        routerConfig: _router,
      ),
    );
  }
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) => const HomeView(),
      routes: <RouteBase>[
        GoRoute(
          path: 'details',
          pageBuilder: (_, state) => CustomSlideTransition(
            key: state.pageKey,
            child: const BreedDetailView(),
          ),
        ),
      ],
    ),
  ],
);
