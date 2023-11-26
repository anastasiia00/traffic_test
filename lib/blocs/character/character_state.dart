// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:test_project/models/character_model.dart';

@immutable
abstract class CharacterState extends Equatable {}

class CharacterLoadingState extends CharacterState {
  @override
  List<Object?> get props => [];
}

class CharacterLoadedState extends CharacterState {
  List<CharacterModel> character;

  List<CharacterModel> get favourites =>
      character.where((element) => element.isFavourite).toList();

  CharacterLoadedState(this.character);

  @override
  List<Object?> get props => [character];
}

class CharacterErrorState extends CharacterState {
  String error;

  CharacterErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
