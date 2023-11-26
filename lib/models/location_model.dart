import 'dart:convert';

import 'package:flutter/foundation.dart';

class LocationModel {
  final String name;
  final String url;

  LocationModel({
    required this.name,
    required this.url,
  });

  LocationModel copyWith({
    String? name,
    String? url,
  }) {
    return LocationModel(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'url': url,
    };
  }

  factory LocationModel.fromMap(Map<String, dynamic> map) {
    return LocationModel(
      name: map['name'] as String,
      url: map['url'] as String,
    );
  }

  factory LocationModel.fromNetwork(dynamic data) {
    if (kDebugMode) {
      print(data);
    }
    return LocationModel(
      name: data['name'],
      url: data['url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LocationModel.fromJson(String source) =>
      LocationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'LocationModel(name: $name, url: $url)';

  @override
  bool operator ==(covariant LocationModel other) {
    if (identical(this, other)) return true;

    return other.name == name && other.url == url;
  }

  @override
  int get hashCode => name.hashCode ^ url.hashCode;
}
