import 'dart:convert';

class ExtraItemModel {
  final String extraItemId;
  final String name;
  final double price;
  ExtraItemModel({
    required this.extraItemId,
    required this.name,
    required this.price,
  });

  ExtraItemModel copyWith({
    String? extraItemId,
    String? name,
    double? price,
  }) {
    return ExtraItemModel(
      extraItemId: extraItemId ?? this.extraItemId,
      name: name ?? this.name,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'extraItemId': extraItemId,
      'name': name,
      'price': price,
    };
  }

  factory ExtraItemModel.fromMap(Map<String, dynamic> map) {
    return ExtraItemModel(
      extraItemId: map['extraItemId'] ?? '',
      name: map['name'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ExtraItemModel.fromJson(String source) =>
      ExtraItemModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'ExtraItemModel(extraItemId: $extraItemId, name: $name, price: $price)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ExtraItemModel &&
        other.extraItemId == extraItemId &&
        other.name == name &&
        other.price == price;
  }

  @override
  int get hashCode => extraItemId.hashCode ^ name.hashCode ^ price.hashCode;
}
