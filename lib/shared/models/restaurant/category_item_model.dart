import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:cardap/shared/models/restaurant/extra_item_model.dart';

class CategoryItemModel {
  final String productId;
  final String productImg;
  final String productName;
  final String productPrice;
  final String productDescription;
  final int productNumber;
  List<ExtraItemModel>? productExtraItems;

  CategoryItemModel({
    required this.productId,
    required this.productImg,
    required this.productName,
    required this.productPrice,
    required this.productDescription,
    required this.productNumber,
    this.productExtraItems,
  });

  CategoryItemModel copyWith({
    String? productId,
    String? productImg,
    String? productName,
    String? productPrice,
    String? productDescription,
    int? productNumber,
    List<ExtraItemModel>? productExtraItems,
  }) {
    return CategoryItemModel(
      productId: productId ?? this.productId,
      productImg: productImg ?? this.productImg,
      productName: productName ?? this.productName,
      productPrice: productPrice ?? this.productPrice,
      productDescription: productDescription ?? this.productDescription,
      productNumber: productNumber ?? this.productNumber,
      productExtraItems: productExtraItems ?? this.productExtraItems,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'productImg': productImg,
      'productName': productName,
      'productPrice': productPrice,
      'productDescription': productDescription,
      'productNumber': productNumber,
      'productExtraItems': productExtraItems?.map((x) => x.toMap()).toList(),
    };
  }

  factory CategoryItemModel.fromMap(Map<String, dynamic> map) {
    return CategoryItemModel(
      productId: map['productId'] ?? '',
      productImg: map['productImg'] ?? '',
      productName: map['productName'] ?? '',
      productPrice: map['productPrice'] ?? '',
      productDescription: map['productDescription'] ?? '',
      productNumber: map['productNumber']?.toInt() ?? 0,
      productExtraItems: map['productExtraItems'] != null
          ? List<ExtraItemModel>.from(
              map['productExtraItems']?.map((x) => ExtraItemModel.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryItemModel.fromJson(String source) =>
      CategoryItemModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CategoryItemModel(productId: $productId, productImg: $productImg, productName: $productName, productPrice: $productPrice, productDescription: $productDescription, productNumber: $productNumber, productExtraItems: $productExtraItems)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CategoryItemModel &&
        other.productId == productId &&
        other.productImg == productImg &&
        other.productName == productName &&
        other.productPrice == productPrice &&
        other.productDescription == productDescription &&
        other.productNumber == productNumber &&
        listEquals(other.productExtraItems, productExtraItems);
  }

  @override
  int get hashCode {
    return productId.hashCode ^
        productImg.hashCode ^
        productName.hashCode ^
        productPrice.hashCode ^
        productDescription.hashCode ^
        productNumber.hashCode ^
        productExtraItems.hashCode;
  }
}
