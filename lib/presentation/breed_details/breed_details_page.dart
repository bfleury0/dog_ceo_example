import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dog_ceo_example/di/di_container.dart';
import 'package:dog_ceo_example/domain/model/breed.dart';
import 'package:dog_ceo_example/presentation/breed_details/bloc/breed_details_bloc.dart';
import 'package:dog_ceo_example/presentation/widgets/page_content_error.dart';
import 'package:dog_ceo_example/presentation/widgets/page_content_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class BreedDetailsPage extends StatelessWidget {
  const BreedDetailsPage({
    super.key,
    @pathParam required this.breedId,
  });

  final String breedId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Breed details')),
      body: BlocProvider(
        create: (context) => diContainer<BreedDetailsBloc>(param1: breedId),
        child: BlocBuilder<BreedDetailsBloc, BreedDetailsState>(
          builder: (context, state) => switch (state) {
            InitialBreedDetailsState() => const SizedBox(),
            LoadingBreedDetailsState() => const PageContentLoading(),
            ContentBreedDetailsState() =>
              BreedDetailsContent(breedId: breedId, breed: state.breeds),
            ErrorBreedDetailsState() => PageContentError(
                onRetry: () => context
                    .read<BreedDetailsBloc>()
                    .add(const RetryBreedDetailsEvent()),
              ),
          },
        ),
      ),
    );
  }
}

class BreedDetailsContent extends StatelessWidget {
  const BreedDetailsContent(
      {super.key, required this.breed, required this.breedId});

  final Breed breed;
  final String breedId;

  @override
  Widget build(BuildContext context) {
    final breedDetail = breed.message[0];
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            breedId,
            style: const TextStyle(fontSize: 20),
          ),
          Expanded(
            child: Center(
              child: CachedNetworkImage(
                imageUrl: breedDetail,
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  size: 60,
                  color: Colors.red,
                ),
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(value: downloadProgress.progress),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
