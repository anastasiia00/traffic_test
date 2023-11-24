import 'package:flutter/material.dart';

class CharacterItem extends StatelessWidget {
  const CharacterItem({
    Key? key,
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
    this.image,
  }) : super(key: key);

  final String? name;
  final String? status;
  final String? species;
  final String? type;
  final String? gender;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.black12,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
        child: Row(
          children: [
            image != null
                ? CircleAvatar(
                    foregroundImage: NetworkImage(image!),
                  )
                : const CircleAvatar(
                    foregroundImage: NetworkImage(
                        'https://media.istockphoto.com/illustrations/blank-man-profile-head-icon-placeholder-illustration-id1298261537?k=20&m=1298261537&s=612x612&w=0&h=8plXnK6Ur3LGqG9s-Xt2ZZfKk6bI0IbzDZrNH9tr9Ok='),
                  ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  name != null
                      ? Text(
                          name!,
                        )
                      : SizedBox(),
                  gender != null
                      ? Text(
                          gender!,
                        )
                      : SizedBox(),
                ],
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(
            //     left: 16,
            //   ),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       status != null
            //           ? Text(
            //               status!,
            //             )
            //           : SizedBox(),
            //       species != null
            //           ? Text(
            //               species!,
            //             )
            //           : SizedBox(),
            //       type != null
            //           ? Text(
            //               type!,
            //             )
            //           : SizedBox(),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
