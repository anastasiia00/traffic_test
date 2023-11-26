import 'package:equatable/equatable.dart';

import '../../models/character_model.dart';

abstract class CharacterEvent extends Equatable {
  const CharacterEvent();
}

class LoadCharacterEvent extends CharacterEvent {
  @override
  List<Object?> get props => [];
}

class AddWishListCharacter extends CharacterEvent {
  final CharacterModel characterModel;

  const AddWishListCharacter(this.characterModel);

  @override
  List<Object> get props => [characterModel];
}

class RemoveFromWishListCharacter extends CharacterEvent {
  final CharacterModel characterModel;

  const RemoveFromWishListCharacter(this.characterModel);

  @override
  List<Object> get props => [characterModel];
}
