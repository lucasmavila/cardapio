import 'package:cardap/shared/data/cities.dart';
import 'package:cardap/shared/models/store_model.dart';
import 'package:flutter/material.dart';

class StoreController extends ChangeNotifier {
  StoreModel store = StoreModel();

  Future<void> loadFromId(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2));
    store = StoreModel.fromMap(storesDataSet[0]);
    notifyListeners();
    Navigator.pushNamed(context, "/home");
  }
}
