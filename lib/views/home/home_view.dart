import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/blocs/character/character_bloc.dart';
import 'package:test_project/blocs/character/character_event.dart';
import 'package:test_project/blocs/character/character_state.dart';
import 'package:test_project/blocs/theme/theme_cubit.dart';
import 'package:test_project/models/character_model.dart';
import 'package:test_project/services/remote_services.dart';
import 'package:test_project/views/detail_view.dart';
import 'package:test_project/views/favourite/favourite_view.dart';
import 'package:test_project/widgets/character_item.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final CharacterBloc bloc =
        CharacterBloc(RepositoryProvider.of<RemoteServices>(context));

    return BlocProvider(
      create: (context) => bloc..add(LoadCharacterEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Choose your favourite character',
          ),
          centerTitle: true,
        ),
        drawer: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return Drawer(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return FavouriteView(bloc: bloc);
                          }));
                        },
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Favourite characters'),
                            Padding(
                              padding: EdgeInsets.only(
                                top: 8,
                                bottom: 4,
                                right: 16,
                              ),
                              child: Divider(
                                height: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        const Text(
                          'Theme Switcher',
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Switch(
                          value:
                              state.themeMode == ThemeMode.light ? false : true,
                          onChanged: (bool value) {
                            BlocProvider.of<ThemeCubit>(context).switchTheme();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        body: BlocBuilder<CharacterBloc, CharacterState>(
          builder: (context, state) {
            if (state is CharacterLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CharacterLoadedState) {
              List<CharacterModel> characterList = state.character;
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 24,
                ),
                child: ListView.builder(
                  itemCount: characterList.length,
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
                                  characterModel: characterList[index],
                                  onAddToFavourite: () {
                                    bloc.add(
                                      AddWishListCharacter(
                                        characterList[index],
                                      ),
                                    );
                                  },
                                  onRemoveFromFavourite: () {
                                    bloc.add(
                                      RemoveFromWishListCharacter(
                                        characterList[index],
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          );
                        },
                        child: CharacterItem(
                          characterModel: characterList[index],
                          onAddToFavourite: () {
                            BlocProvider.of<CharacterBloc>(context).add(
                              AddWishListCharacter(
                                characterList[index],
                              ),
                            );
                          },
                          onRemoveFromFavourite: () {
                            BlocProvider.of<CharacterBloc>(context).add(
                              RemoveFromWishListCharacter(
                                characterList[index],
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  }),
                ),
              );
            }

            if (state is CharacterErrorState) {
              return Center(
                child: SizedBox(
                  height: 400,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/0121d5720b6cc0bbf06f3d2aed4d913a.jpg',
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                          left: 26,
                          right: 26,
                          top: 42,
                        ),
                        child: Text(
                          'Sorry, this page has some troubles! Please, waite a minute, or reload app.',
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
