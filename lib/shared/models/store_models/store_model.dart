import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:cardap/shared/models/store_models/address_model.dart';
import 'package:cardap/shared/models/store_models/item_model.dart';

class StoreModel {
  String? id;
  String? name;
  String? status;
  AddressModel? address;
  String? logo;
  List<ItemModel>? menu;
  String? primaryColor;
  String? secondaryColor;
  StoreModel({
    this.id,
    this.name,
    this.status,
    this.address,
    this.logo,
    this.menu,
    this.primaryColor,
    this.secondaryColor,
  });

  StoreModel copyWith({
    String? id,
    String? name,
    String? status,
    AddressModel? address,
    String? logo,
    List<ItemModel>? menu,
    String? primaryColor,
    String? secondaryColor,
  }) {
    return StoreModel(
      id: id ?? this.id,
      name: name ?? this.name,
      status: status ?? this.status,
      address: address ?? this.address,
      logo: logo ?? this.logo,
      menu: menu ?? this.menu,
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'status': status,
      'address': address?.toMap(),
      'logo': logo,
      'menu': menu?.map((x) => x.toMap()).toList(),
      'primaryColor': primaryColor,
      'secondaryColor': secondaryColor,
    };
  }

  factory StoreModel.fromMap(Map<String, dynamic> map) {
    return StoreModel(
      id: map['id'],
      name: map['name'],
      status: map['status'],
      address:
          map['address'] != null ? AddressModel.fromMap(map['address']) : null,
      logo: map['logo'],
      menu: map['menu'] != null
          ? List<ItemModel>.from(map['menu']?.map((x) => ItemModel.fromMap(x)))
          : null,
      primaryColor: map['primaryColor'],
      secondaryColor: map['secondaryColor'],
    );
  }

  String toJson() => json.encode(toMap());

  factory StoreModel.fromJson(String source) =>
      StoreModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'StoreModel(id: $id, name: $name, status: $status, address: $address, logo: $logo, menu: $menu, primaryColor: $primaryColor, secondaryColor: $secondaryColor)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is StoreModel &&
        other.id == id &&
        other.name == name &&
        other.status == status &&
        other.address == address &&
        other.logo == logo &&
        listEquals(other.menu, menu) &&
        other.primaryColor == primaryColor &&
        other.secondaryColor == secondaryColor;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        status.hashCode ^
        address.hashCode ^
        logo.hashCode ^
        menu.hashCode ^
        primaryColor.hashCode ^
        secondaryColor.hashCode;
  }
}
