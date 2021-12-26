import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:cardap/shared/models/restaurant/category_item_model.dart';

class CategoryModel {
  final String categorieId;
  final String categorieName;
  final List<CategoryItemModel> categorieItens;
  CategoryModel({
    required this.categorieId,
    required this.categorieName,
    required this.categorieItens,
  });

  CategoryModel copyWith({
    String? categorieId,
    String? categorieName,
    List<CategoryItemModel>? categorieItens,
  }) {
    return CategoryModel(
      categorieId: categorieId ?? this.categorieId,
      categorieName: categorieName ?? this.categorieName,
      categorieItens: categorieItens ?? this.categorieItens,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'categorieId': categorieId,
      'categorieName': categorieName,
      'categorieItens': categorieItens.map((x) => x.toMap()).toList(),
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      categorieId: map['categorieId'],
      categorieName: map['categorieName'],
      categorieItens: List<CategoryItemModel>.from(
          map['categorieItens']?.map((x) => CategoryItemModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'CategoryModel(categorieId: $categorieId, categorieName: $categorieName, categorieItens: $categorieItens)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CategoryModel &&
        other.categorieId == categorieId &&
        other.categorieName == categorieName &&
        listEquals(other.categorieItens, categorieItens);
  }

  @override
  int get hashCode =>
      categorieId.hashCode ^ categorieName.hashCode ^ categorieItens.hashCode;
}
