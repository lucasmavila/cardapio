import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:cardap/shared/models/restaurant/category_model.dart';

class RestaurantModel {
  String? restaurantUrlName;
  String? restaurantName;
  String? restaurantWppNumber;
  String? restaurantImg;
  List<CategoryModel>? categories;

  RestaurantModel({
    this.restaurantUrlName,
    this.restaurantName,
    this.restaurantWppNumber,
    this.restaurantImg,
    this.categories,
  });

  RestaurantModel copyWith({
    String? restaurantUrlName,
    String? restaurantName,
    String? restaurantWppNumber,
    String? restaurantImg,
    List<CategoryModel>? categories,
  }) {
    return RestaurantModel(
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

  factory RestaurantModel.fromMap(Map<String, dynamic> map) {
    return RestaurantModel(
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

  factory RestaurantModel.fromJson(String source) =>
      RestaurantModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RestaurantModel(restaurantUrlName: $restaurantUrlName, restaurantName: $restaurantName, restaurantWppNumber: $restaurantWppNumber, restaurantImg: $restaurantImg, categories: $categories)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RestaurantModel &&
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
