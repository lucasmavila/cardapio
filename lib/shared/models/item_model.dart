import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:cardap/shared/models/additional_item_model.dart';

class ItemModel {
  final String name;
  final String description;
  final int mainPhoto;
  final double price;
  final List<String> images;
  final List<AdditionalItemModel>? additionalItems;
  String? observation;
  ItemModel({
    required this.name,
    required this.description,
    required this.mainPhoto,
    required this.price,
    required this.images,
    this.additionalItems,
    this.observation,
  });

  ItemModel copyWith({
    String? name,
    String? description,
    int? mainPhoto,
    double? price,
    List<String>? images,
    List<AdditionalItemModel>? additionalItems,
    String? observation,
  }) {
    return ItemModel(
      name: name ?? this.name,
      description: description ?? this.description,
      mainPhoto: mainPhoto ?? this.mainPhoto,
      price: price ?? this.price,
      images: images ?? this.images,
      additionalItems: additionalItems ?? this.additionalItems,
      observation: observation ?? this.observation,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'mainPhoto': mainPhoto,
      'price': price,
      'images': images,
      'additionalItems': additionalItems?.map((x) => x.toMap()).toList(),
      'observation': observation,
    };
  }

  factory ItemModel.fromMap(Map<String, dynamic> map) {
    return ItemModel(
      name: map['name'],
      description: map['description'],
      mainPhoto: map['mainPhoto'],
      price: map['price'],
      images: List<String>.from(map['images']),
      additionalItems: map['additionalItems'] != null
          ? List<AdditionalItemModel>.from(map['additionalItems']
              ?.map((x) => AdditionalItemModel.fromMap(x)))
          : null,
      observation: map['observation'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemModel.fromJson(String source) =>
      ItemModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ItemModel(name: $name, description: $description, mainPhoto: $mainPhoto, price: $price, images: $images, additionalItems: $additionalItems, observation: $observation)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ItemModel &&
        other.name == name &&
        other.description == description &&
        other.mainPhoto == mainPhoto &&
        other.price == price &&
        listEquals(other.images, images) &&
        listEquals(other.additionalItems, additionalItems) &&
        other.observation == observation;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        description.hashCode ^
        mainPhoto.hashCode ^
        price.hashCode ^
        images.hashCode ^
        additionalItems.hashCode ^
        observation.hashCode;
  }
}
