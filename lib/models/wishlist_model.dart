// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:test_project/models/character_model.dart';

class WishListModel {
  final List<CharacterModel> characterList;

  WishListModel({
    this.characterList = const <CharacterModel>[],
  });

  WishListModel copyWith({
    List<CharacterModel>? characterList,
  }) {
    return WishListModel(
      characterList: characterList ?? this.characterList,
    );
  }
}
