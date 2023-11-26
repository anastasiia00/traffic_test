import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:test_project/models/character_model.dart';

class RemoteServices {
  String baseUrl = 'https://rickandmortyapi.com/api';

  Future<List<CharacterModel>> getCharacter() async {
    debugPrint("[RemoteServices] getCharacter");
    Response response = await get(Uri.parse('$baseUrl/character'));

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['results'];
      List<CharacterModel> bus = [];
      for (dynamic element in result) {
        bus.add(CharacterModel.fromNetwork(element));
      }
      return bus;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
