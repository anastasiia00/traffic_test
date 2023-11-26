// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/blocs/character/character_bloc.dart';
import 'package:test_project/blocs/character/character_state.dart';
import 'package:test_project/models/character_model.dart';
import 'package:test_project/widgets/detail_item.dart';

class DetailView extends StatelessWidget {
  const DetailView({
    super.key,
    required this.characterModel,
    required this.onAddToFavourite,
    required this.onRemoveFromFavourite,
    required this.bloc,
  });

  final CharacterModel characterModel;
  final Function onAddToFavourite;
  final Function onRemoveFromFavourite;
  final CharacterBloc bloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharacterBloc, CharacterState>(
      bloc: bloc,
      builder: (context, state) {
        final CharacterModel element = (state as CharacterLoadedState)
            .character
            .firstWhere((el) => el.id == characterModel.id);
        return Scaffold(
          appBar: AppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.only(
                  right: 24,
                ),
                child: !element.isFavourite
                    ? IconButton(
                        onPressed: () {
                          onAddToFavourite();
                        },
                        icon: const Icon(
                          Icons.favorite_border,
                          size: 24,
                        ),
                      )
                    : IconButton(
                        onPressed: () {
                          onRemoveFromFavourite();
                        },
                        icon: const Icon(
                          Icons.favorite_outlined,
                        ),
                      ),
              ),
            ],
          ),
          body: Column(
            children: [
              const SizedBox(
                height: 32,
              ),
              Text(
                '${element.name} | ${element.status}',
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 24,
              ),
              Image.network(
                element.image,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 32,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 4,
                        bottom: 4,
                      ),
                      child: DetailItem(
                        title: 'Species',
                        description: element.species,
                      ),
                    ),
                    element.type != null && element.type != ''
                        ? DetailItem(
                            title: 'Type of the character',
                            description: element.type,
                          )
                        : const SizedBox(),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 4,
                        bottom: 4,
                      ),
                      child: DetailItem(
                        title: 'Gender',
                        description: element.gender,
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(
                          top: 4,
                          bottom: 4,
                        ),
                        child: DetailItem(
                          title: 'Character\'s origin location',
                          description: element.origin.name,
                        )),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 4,
                        bottom: 4,
                      ),
                      child: DetailItem(
                        title: 'Character\'s last known location endpoint',
                        description: element.location.name,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
