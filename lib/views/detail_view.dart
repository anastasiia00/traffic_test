import 'package:flutter/material.dart';
import 'package:test_project/models/character_model.dart';
import 'package:test_project/widgets/detail_item.dart';

class DetailView extends StatelessWidget {
  const DetailView({
    super.key,
    required this.element,
  });

  final CharacterModel element;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 32,
          ),
          element.name != null || element.status != null
              ? Text(
                  element.name + ' | ' + element.status,
                  style: TextStyle(fontSize: 20),
                )
              : const SizedBox(),
          const SizedBox(
            height: 24,
          ),
          Image.network(
            element.image ??
                'https://media.istockphoto.com/illustrations/blank-man-profile-head-icon-placeholder-illustration-id1298261537?k=20&m=1298261537&s=612x612&w=0&h=8plXnK6Ur3LGqG9s-Xt2ZZfKk6bI0IbzDZrNH9tr9Ok=',
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
                    : SizedBox(),
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
                    ) //TODO: element.origin.url
                    ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 4,
                    bottom: 4,
                  ),
                  child: DetailItem(
                    title: 'Character\'s last known location endpoint',
                    description:
                        element.location.name, //TODO: element.location.url
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(
                //     top: 4,
                //     bottom: 4,
                //   ),
                //   child: DetailItem(
                //     title: 'Episode',
                //     description: element.episode.toString(),
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
