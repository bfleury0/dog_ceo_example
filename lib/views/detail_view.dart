// ignore_for_file: type_literal_in_constant_pattern

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dog_ceo_example/bloc/breed_detail_bloc.dart';
import 'package:dog_ceo_example/bloc/breeds_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BreedDetailView extends StatelessWidget {
  const BreedDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Breed detail')),
      body: Center(
        child: BlocBuilder<BreedDetailBloc, BreedDetailState>(
          builder: (context, state) {
            switch (state.runtimeType) {
              case BreedDetailInitial:
              case BreedDetailLoading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case BreedDetailSuccess:
                final breed = (state as BreedDetailSuccess).breed;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      breed,
                      style: const TextStyle(fontSize: 20),
                    ),
                    Center(
                      child: CachedNetworkImage(
                        imageUrl: state.image,
                        errorWidget: (context, url, error) => const Icon(
                          Icons.error,
                          size: 60,
                          color: Colors.red,
                        ),
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) =>
                                CircularProgressIndicator(
                                    value: downloadProgress.progress),
                      ),
                    ),
                  ],
                );
              case BreedDetailsFailure:
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
