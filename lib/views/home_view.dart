// ignore_for_file: type_literal_in_constant_pattern

import 'package:dog_ceo_example/bloc/breed_detail_bloc.dart';
import 'package:dog_ceo_example/bloc/breeds_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  Widget _breedBuilder(List<String> breeds) => ListView.builder(
        itemCount: breeds.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(breeds[index]),
          onTap: () {
            context
                .read<BreedDetailBloc>()
                .add(BreedSelectedEvent(breeds[index]));
            context.go('/details');
          },
        ),
      );

  @override
  Widget build(BuildContext context) {
    final breedsBloc = BlocProvider.of<BreedsBloc>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Dog Breeds')),
      body: Center(
        child: BlocBuilder(
          bloc: breedsBloc..add(BreedsFetchEvent()),
          builder: (context, state) {
            switch (state.runtimeType) {
              case BreedsInitial:
              case BreedsLoading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case BreedsSuccess:
                var breeds = (state as BreedsSuccess).breeds;
                return _breedBuilder(breeds);
              case BreedsFailure:
                var errorMessage = (state as BreedsFailure).errorMessage;
                return Center(
                  child: Text(errorMessage),
                );
              default:
                return const Placeholder();
            }
          },
        ),
      ),
    );
  }
}
