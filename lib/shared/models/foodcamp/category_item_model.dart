import 'dart:convert';

import 'package:flutter/foundation.dart';

class CategoryItemModel {
  final String productId;
  final String productImg;
  final String productName;
  final String productPrice;
  final String productDescription;
  final int productNumber;
  CategoryItemModel({
    required this.productId,
    required this.productImg,
    required this.productName,
    required this.productPrice,
    required this.productDescription,
    required this.productNumber,
  });

  CategoryItemModel copyWith({
    String? productId,
    String? productImg,
    String? productName,
    String? productPrice,
    String? productDescription,
    int? productNumber,
  }) {
    return CategoryItemModel(
      productId: productId ?? this.productId,
      productImg: productImg ?? this.productImg,
      productName: productName ?? this.productName,
      productPrice: productPrice ?? this.productPrice,
      productDescription: productDescription ?? this.productDescription,
      productNumber: productNumber ?? this.productNumber,
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
    };
  }

  factory CategoryItemModel.fromMap(Map<String, dynamic> map) {
    return CategoryItemModel(
      productId: map['productId'],
      productImg: map['productImg'],
      productName: map['productName'],
      productPrice: map['productPrice'],
      productDescription: map['productDescription'],
      productNumber: map['productNumber'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryItemModel.fromJson(String source) =>
      CategoryItemModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CategoryItemModel(productId: $productId, productImg: $productImg, productName: $productName, productPrice: $productPrice, productDescription: $productDescription, productNumber: $productNumber)';
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
        other.productNumber == productNumber;
  }

  @override
  int get hashCode {
    return productId.hashCode ^
        productImg.hashCode ^
        productName.hashCode ^
        productPrice.hashCode ^
        productDescription.hashCode ^
        productNumber.hashCode;
  }
}
