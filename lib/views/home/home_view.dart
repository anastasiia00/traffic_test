import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/blocs/app_blocs.dart';
import 'package:test_project/blocs/app_events.dart';
import 'package:test_project/blocs/app_state.dart';
import 'package:test_project/models/character_model.dart';
import 'package:test_project/services/remote_services.dart';
import 'package:test_project/views/detail_view.dart';
import 'package:test_project/widgets/character_item.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CharacterBloc(RepositoryProvider.of<RemoteServices>(context))
            ..add(LoadCharacterEvent()),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'Choose your favourite character',
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<CharacterBloc, CharacterState>(
          builder: (context, state) {
            if (state is CharacterLoadingState) {
              return Center(
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
                          onLongPress: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return DetailView(element: characterList[index]);
                            }));
                          },
                          child: CharacterItem(
                            image: characterList[index].image,
                            name: characterList[index].name,
                            gender: characterList[index].gender,
                            status: characterList[index].status,
                            species: characterList[index].species,
                            type: characterList[index].type,
                          ),
                        ),
                      );
                    })),
              );
            }

            if (state is CharacterErrorState) {
              return Center(
                child: Container(
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
            return SizedBox();
          },
        ),
      ),
    );
  }
}
