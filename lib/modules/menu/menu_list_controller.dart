import 'package:cardap/shared/data/cities.dart';
import 'package:cardap/shared/models/item_model.dart';
import 'package:cardap/shared/models/store_model.dart';

class MenuListController {
  List<ItemModel>? menu;
  MenuListController() {
    getMenu();
  }

  Future<void> getMenu() async {
    menu = StoreModel.fromMap(storesDataSet[0]).menu;
  }
}
