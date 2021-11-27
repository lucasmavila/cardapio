import 'package:cardap/shared/data/cities.dart';
import 'package:cardap/shared/models/store_model.dart';
import 'package:flutter/material.dart';

class AuthController {
  Future<void> loadFromLink(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 1));
    StoreModel store = StoreModel.fromMap(storesDataSet[0]);
    Navigator.pushNamed(context, "/home", arguments: store);
  }
}
