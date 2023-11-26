import 'package:flutter/material.dart';
import 'package:test_project/models/character_model.dart';

class CharacterItem extends StatelessWidget {
  const CharacterItem({
    Key? key,
    required this.characterModel,
    required this.onAddToFavourite,
    required this.onRemoveFromFavourite,
  }) : super(key: key);

  final CharacterModel characterModel;
  final Function onAddToFavourite;
  final Function onRemoveFromFavourite;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.black12,
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 24,
          top: 10,
          bottom: 10,
        ),
        child: Row(
          children: [
            CircleAvatar(
              foregroundImage: NetworkImage(characterModel.image),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    characterModel.name,
                  ),
                  Text(
                    characterModel.gender,
                  ),
                ],
              ),
            ),
            const Spacer(),
            !characterModel.isFavourite
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
          ],
        ),
      ),
    );
  }
}
