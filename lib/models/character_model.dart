// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:test_project/models/location_model.dart';
import 'package:test_project/models/origin_models.dart';

class CharacterModel {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final OriginModel origin;
  final LocationModel location;
  final String image;
  final List<String> episode;
  final String url;
  final String created;
  CharacterModel({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });

  CharacterModel copyWith({
    int? id,
    String? name,
    String? status,
    String? species,
    String? type,
    String? gender,
    OriginModel? origin,
    LocationModel? location,
    String? image,
    List<String>? episode,
    String? url,
    String? created,
  }) {
    return CharacterModel(
      id: id ?? this.id,
      name: name ?? this.name,
      status: status ?? this.status,
      species: species ?? this.species,
      type: type ?? this.type,
      gender: gender ?? this.gender,
      origin: origin ?? this.origin,
      location: location ?? this.location,
      image: image ?? this.image,
      episode: episode ?? this.episode,
      url: url ?? this.url,
      created: created ?? this.created,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'status': status,
      'species': species,
      'type': type,
      'gender': gender,
      'origin': origin.toMap(),
      'location': location.toMap(),
      'image': image,
      'episode': episode,
      'url': url,
      'created': created,
    };
  }

  factory CharacterModel.fromMap(Map<String, dynamic> map) {
    return CharacterModel(
      id: map['id'] as int,
      name: map['name'] as String,
      status: map['status'] as String,
      species: map['species'] as String,
      type: map['type'] as String,
      gender: map['gender'] as String,
      origin: OriginModel.fromMap(map['origin'] as Map<String, dynamic>),
      location: LocationModel.fromMap(map['location'] as Map<String, dynamic>),
      image: map['image'] as String,
      episode: List<String>.from(
        (map['episode'] as List<String>),
      ),
      url: map['url'] as String,
      created: map['created'] as String,
    );
  }

  factory CharacterModel.fromNetwork(dynamic data) {
    try {
      List<String> epizodesBus = [];
      data['episode'].forEach((el) => epizodesBus.add(el.toString()));
      return CharacterModel(
        id: data['id'],
        name: data['name'] ?? "jui",
        status: data['status'] ?? "jui",
        species: data['species'] ?? "jui",
        type: data['type'] ?? "jui",
        gender: data['gender'] ?? "jui",
        origin: OriginModel.fromNetwork(data['origin']),
        location: LocationModel.fromNetwork(data['location']),
        image: data['image'] ?? "jui",
        episode: epizodesBus,
        url: data['url'] ?? "jui",
        created: data['created'] ?? "jui",
      );
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      throw Exception();
    }
  }

  String toJson() => json.encode(toMap());

  factory CharacterModel.fromJson(String source) =>
      CharacterModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CharacterModel(id: $id, name: $name, status: $status, species: $species, type: $type, gender: $gender, origin: $origin, location: $location, image: $image, episode: $episode, url: $url, created: $created)';
  }

  @override
  bool operator ==(covariant CharacterModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.status == status &&
        other.species == species &&
        other.type == type &&
        other.gender == gender &&
        other.origin == origin &&
        other.location == location &&
        other.image == image &&
        listEquals(other.episode, episode) &&
        other.url == url &&
        other.created == created;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        status.hashCode ^
        species.hashCode ^
        type.hashCode ^
        gender.hashCode ^
        origin.hashCode ^
        location.hashCode ^
        image.hashCode ^
        episode.hashCode ^
        url.hashCode ^
        created.hashCode;
  }
}
