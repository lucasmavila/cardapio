import 'dart:convert';

class AdditionalItemModel {
  String name;
  double price;
  int? count;
  AdditionalItemModel({
    required this.name,
    required this.price,
    this.count,
  });

  AdditionalItemModel copyWith({
    String? name,
    double? price,
    int? count,
  }) {
    return AdditionalItemModel(
      name: name ?? this.name,
      price: price ?? this.price,
      count: count ?? this.count,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'count': count,
    };
  }

  factory AdditionalItemModel.fromMap(Map<String, dynamic> map) {
    return AdditionalItemModel(
      name: map['name'],
      price: map['price'],
      count: map['count'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory AdditionalItemModel.fromJson(String source) =>
      AdditionalItemModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'AdditionalItemModel(name: $name, price: $price, count: $count)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AdditionalItemModel &&
        other.name == name &&
        other.price == price &&
        other.count == count;
  }

  @override
  int get hashCode => name.hashCode ^ price.hashCode ^ count.hashCode;
}
