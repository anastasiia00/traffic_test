import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/blocs/character/character_event.dart';
import 'package:test_project/blocs/character/character_state.dart';
import 'package:test_project/services/remote_services.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final RemoteServices _remoteServices;

  CharacterBloc(this._remoteServices) : super(CharacterLoadingState()) {
    on<LoadCharacterEvent>((event, emit) async {
      debugPrint("[CharacterBloc] LoadCharacterEvent");
      emit(CharacterLoadingState());
      try {
        final characters = await _remoteServices.getCharacter();
        emit(CharacterLoadedState(characters));
      } catch (e) {
        emit(CharacterErrorState(e.toString()));
      }
    });

    on<AddWishListCharacter>((event, emit) {
      debugPrint('[CharacterBloc] AddWishLictCharacter');
      emit(
        CharacterLoadedState(
          (state as CharacterLoadedState).character.map((e) {
            if (event.characterModel.id == e.id) {
              return e.copyWith(isFavourite: true);
            }
            return e;
          }).toList(),
        ),
      );
    });

    on<RemoveFromWishListCharacter>((event, emit) {
      debugPrint('[CharacterBloc] RemoveFromWishListCharacter');
      emit(
        CharacterLoadedState(
          (state as CharacterLoadedState).character.map((e) {
            if (event.characterModel.id == e.id) {
              return e.copyWith(isFavourite: false);
            }
            return e;
          }).toList(),
        ),
      );
    });
  }
}
