import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:cardap/shared/models/restaurant/category_item_model.dart';
import 'package:cardap/shared/models/store_models/address_model.dart';

class OrderModel {
  String? status;
  double? orderAmount;
  List<CategoryItemModel>? items;
  AddressModel? deliveryAddress;
  double? deliveryAmount;
  String? deliveryType;
  OrderModel({
    this.status,
    this.orderAmount,
    this.items,
    this.deliveryAddress,
    this.deliveryAmount,
    this.deliveryType,
  });

  OrderModel copyWith({
    String? status,
    double? orderAmount,
    List<CategoryItemModel>? items,
    AddressModel? deliveryAddress,
    double? deliveryAmount,
    String? deliveryType,
  }) {
    return OrderModel(
      status: status ?? this.status,
      orderAmount: orderAmount ?? this.orderAmount,
      items: items ?? this.items,
      deliveryAddress: deliveryAddress ?? this.deliveryAddress,
      deliveryAmount: deliveryAmount ?? this.deliveryAmount,
      deliveryType: deliveryType ?? this.deliveryType,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'orderAmount': orderAmount,
      'items': items?.map((x) => x.toMap()).toList(),
      'deliveryAddress': deliveryAddress?.toMap(),
      'deliveryAmount': deliveryAmount,
      'deliveryType': deliveryType,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      status: map['status'],
      orderAmount: map['orderAmount']?.toDouble(),
      items: map['items'] != null
          ? List<CategoryItemModel>.from(
              map['items']?.map((x) => CategoryItemModel.fromMap(x)))
          : null,
      deliveryAddress: map['deliveryAddress'] != null
          ? AddressModel.fromMap(map['deliveryAddress'])
          : null,
      deliveryAmount: map['deliveryAmount']?.toDouble(),
      deliveryType: map['deliveryType'],
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) =>
      OrderModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'OrderModel(status: $status, orderAmount: $orderAmount, items: $items, deliveryAddress: $deliveryAddress, deliveryAmount: $deliveryAmount, deliveryType: $deliveryType)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OrderModel &&
        other.status == status &&
        other.orderAmount == orderAmount &&
        listEquals(other.items, items) &&
        other.deliveryAddress == deliveryAddress &&
        other.deliveryAmount == deliveryAmount &&
        other.deliveryType == deliveryType;
  }

  @override
  int get hashCode {
    return status.hashCode ^
        orderAmount.hashCode ^
        items.hashCode ^
        deliveryAddress.hashCode ^
        deliveryAmount.hashCode ^
        deliveryType.hashCode;
  }
}
