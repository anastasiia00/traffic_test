import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/blocs/app/app_events.dart';
import 'package:test_project/blocs/app/app_state.dart';
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
  }
}
