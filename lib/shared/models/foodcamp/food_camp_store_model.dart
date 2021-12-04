import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:cardap/shared/models/foodcamp/category_model.dart';

class FoodCampStoreModel {
  String? restaurantUrlName;
  String? restaurantName;
  String? restaurantWppNumber;
  String? restaurantImg;

  List<CategoryModel>? categories;

  FoodCampStoreModel({
    this.restaurantUrlName,
    this.restaurantName,
    this.restaurantWppNumber,
    this.restaurantImg,
    this.categories,
  });

  FoodCampStoreModel copyWith({
    String? restaurantUrlName,
    String? restaurantName,
    String? restaurantWppNumber,
    String? restaurantImg,
    List<CategoryModel>? categories,
  }) {
    return FoodCampStoreModel(
      restaurantUrlName: restaurantUrlName ?? this.restaurantUrlName,
      restaurantName: restaurantName ?? this.restaurantName,
      restaurantWppNumber: restaurantWppNumber ?? this.restaurantWppNumber,
      restaurantImg: restaurantImg ?? this.restaurantImg,
      categories: categories ?? this.categories,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'restaurantUrlName': restaurantUrlName,
      'restaurantName': restaurantName,
      'restaurantWppNumber': restaurantWppNumber,
      'restaurantImg': restaurantImg,
      'categories': categories?.map((x) => x.toMap()).toList(),
    };
  }

  factory FoodCampStoreModel.fromMap(Map<String, dynamic> map) {
    return FoodCampStoreModel(
      restaurantUrlName: map['restaurantUrlName'],
      restaurantName: map['restaurantName'],
      restaurantWppNumber: map['restaurantWppNumber'],
      restaurantImg: map['restaurantImg'],
      categories: map['categories'] != null
          ? List<CategoryModel>.from(
              map['categories']?.map((x) => CategoryModel.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory FoodCampStoreModel.fromJson(String source) =>
      FoodCampStoreModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'FoodCampStoreModel(restaurantUrlName: $restaurantUrlName, restaurantName: $restaurantName, restaurantWppNumber: $restaurantWppNumber, restaurantImg: $restaurantImg, categories: $categories)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FoodCampStoreModel &&
        other.restaurantUrlName == restaurantUrlName &&
        other.restaurantName == restaurantName &&
        other.restaurantWppNumber == restaurantWppNumber &&
        other.restaurantImg == restaurantImg &&
        listEquals(other.categories, categories);
  }

  @override
  int get hashCode {
    return restaurantUrlName.hashCode ^
        restaurantName.hashCode ^
        restaurantWppNumber.hashCode ^
        restaurantImg.hashCode ^
        categories.hashCode;
  }
}
