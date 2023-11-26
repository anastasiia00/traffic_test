import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/blocs/character/character_bloc.dart';
import 'package:test_project/blocs/character/character_event.dart';
import 'package:test_project/blocs/character/character_state.dart';
import 'package:test_project/views/detail_view.dart';
import 'package:test_project/widgets/character_item.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({
    super.key,
    required this.bloc,
  });

  final CharacterBloc bloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharacterBloc, CharacterState>(
      bloc: bloc,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Favourite character'),
          ),
          body: ListView.builder(
            itemCount: (state as CharacterLoadedState).favourites.length,
            itemBuilder: ((_, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return DetailView(
                            bloc: bloc,
                            characterModel: state.favourites[index],
                            onAddToFavourite: () {
                              bloc.add(
                                AddWishListCharacter(
                                  state.favourites[index],
                                ),
                              );
                            },
                            onRemoveFromFavourite: () {
                              bloc.add(
                                RemoveFromWishListCharacter(
                                  state.favourites[index],
                                ),
                              );
                            },
                          );
                        },
                      ),
                    );
                  },
                  child: CharacterItem(
                    characterModel: state.favourites[index],
                    onAddToFavourite: () {
                      bloc.add(
                        AddWishListCharacter(
                          state.favourites[index],
                        ),
                      );
                    },
                    onRemoveFromFavourite: () {
                      bloc.add(
                        RemoveFromWishListCharacter(
                          state.favourites[index],
                        ),
                      );
                    },
                  ),
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
