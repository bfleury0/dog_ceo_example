import 'package:auto_route/auto_route.dart';
import 'package:dog_ceo_example/constants/text_constants.dart' show appTitle;
import 'package:dog_ceo_example/di/di_container.dart';
import 'package:dog_ceo_example/domain/model/breeds.dart';
import 'package:dog_ceo_example/presentation/breeds_list/bloc/breeds_list_bloc.dart';
import 'package:dog_ceo_example/presentation/widgets/page_content_error.dart';
import 'package:dog_ceo_example/presentation/widgets/page_content_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class BreedsListPage extends StatelessWidget {
  const BreedsListPage({
    super.key,
    @queryParam this.launchId,
  });

  final String? launchId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(appTitle)),
      body: BlocProvider(
        create: (context) => diContainer<BreedsListBloc>(param1: launchId),
        child: BlocBuilder<BreedsListBloc, BreedsListState>(
          builder: (context, state) => switch (state) {
            InitialBreedsListState() => const SizedBox(),
            LoadingBreedsListState() => const PageContentLoading(),
            ContentBreedsListState() => BreedsListContent(breeds: state.breeds),
            ErrorBreedsListState() => PageContentError(
                onRetry: () => context
                    .read<BreedsListBloc>()
                    .add(const RetryBreedsListEvent()),
              ),
          },
        ),
      ),
    );
  }
}

class BreedsListContent extends StatelessWidget {
  const BreedsListContent({
    super.key,
    required this.breeds,
  });

  final Breeds breeds;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: breeds.message.keys.length,
      itemBuilder: (context, index) {
        final breed = breeds.message.keys.toList()[index];
        return ListTile(
          contentPadding: const EdgeInsets.all(16.0),
          title: Text(breed),
          onTap: () => context
              .read<BreedsListBloc>()
              .add(OpenDetailsBreedsListEvent(breed)),
        );
      },
    );
  }
}
