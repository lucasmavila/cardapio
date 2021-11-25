import 'dart:convert';

class AddressModel {
  final String cep;
  final String state;
  final String city;
  final int number;
  AddressModel({
    required this.cep,
    required this.state,
    required this.city,
    required this.number,
  });

  AddressModel copyWith({
    String? cep,
    String? state,
    String? city,
    int? number,
  }) {
    return AddressModel(
      cep: cep ?? this.cep,
      state: state ?? this.state,
      city: city ?? this.city,
      number: number ?? this.number,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'cep': cep,
      'state': state,
      'city': city,
      'number': number,
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      cep: map['cep'],
      state: map['state'],
      city: map['city'],
      number: map['number'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressModel.fromJson(String source) =>
      AddressModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AddressModel(cep: $cep, state: $state, city: $city, number: $number)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AddressModel &&
        other.cep == cep &&
        other.state == state &&
        other.city == city &&
        other.number == number;
  }

  @override
  int get hashCode {
    return cep.hashCode ^ state.hashCode ^ city.hashCode ^ number.hashCode;
  }
}
