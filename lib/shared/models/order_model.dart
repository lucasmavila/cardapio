import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:cardap/shared/models/address_model.dart';
import 'package:cardap/shared/models/item_model.dart';

class OrderModel {
  String? status;
  double? orderAmount;
  List<ItemModel>? items;
  AddressModel? deliveryAddress;
  double? deliveryAmount;
  String? deliveryType;
  OrderModel({
    this.status,
    this.items,
    this.orderAmount,
    this.deliveryAddress,
    this.deliveryAmount,
    this.deliveryType,
  });

  OrderModel copyWith({
    String? status,
    List<ItemModel>? items,
    double? orderAmount,
    AddressModel? deliveryAddress,
    double? deliveryAmount,
    String? deliveryType,
  }) {
    return OrderModel(
      status: status ?? this.status,
      items: items ?? this.items,
      orderAmount: orderAmount ?? this.orderAmount,
      deliveryAddress: deliveryAddress ?? this.deliveryAddress,
      deliveryAmount: deliveryAmount ?? this.deliveryAmount,
      deliveryType: deliveryType ?? this.deliveryType,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'items': items?.map((x) => x.toMap()).toList(),
      'orderAmount': orderAmount,
      'deliveryAddress': deliveryAddress?.toMap(),
      'deliveryAmount': deliveryAmount,
      'deliveryType': deliveryType,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      status: map['status'],
      items: map['items'] != null
          ? List<ItemModel>.from(map['items']?.map((x) => ItemModel.fromMap(x)))
          : <ItemModel>[],
      orderAmount: map['orderAmount'],
      deliveryAddress: map['deliveryAddress'] != null
          ? AddressModel.fromMap(map['deliveryAddress'])
          : null,
      deliveryAmount: map['deliveryAmount'],
      deliveryType: map['deliveryType'],
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) =>
      OrderModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'OrderModel(status: $status, items: $items, orderAmount: $orderAmount, deliveryAddress: $deliveryAddress, deliveryAmount: $deliveryAmount, deliveryType: $deliveryType)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OrderModel &&
        other.status == status &&
        listEquals(other.items, items) &&
        other.orderAmount == orderAmount &&
        other.deliveryAddress == deliveryAddress &&
        other.deliveryAmount == deliveryAmount &&
        other.deliveryType == deliveryType;
  }

  @override
  int get hashCode {
    return status.hashCode ^
        items.hashCode ^
        orderAmount.hashCode ^
        deliveryAddress.hashCode ^
        deliveryAmount.hashCode ^
        deliveryType.hashCode;
  }
}
