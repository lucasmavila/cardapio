import 'package:cardap/routes/routes_controller.dart';
import 'package:cardap/shared/models/restaurant/category_item_model.dart';
import 'package:cardap/shared/models/restaurant/restaurant_model.dart';
import 'package:cardap/shared/models/store_models/store_model.dart';
import 'package:cardap/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

class RestaurantController extends ChangeNotifier {
  RestaurantModel _restaurant = RestaurantModel();
  String _restaurantId = '';
  bool get restaurantReady => _restaurantId.isNotEmpty;
  bool get restaurantNotReady => _restaurantId.isEmpty;
  String get restaurantId => _restaurantId;

  Future<String> loadFromApiUrl(String restaurantString) async {
    if (restaurantNotReady) {
      String dominio = 'https://food-camp-cardapio.herokuapp.com/';

      var url = Uri.parse(dominio + restaurantString);
      final response = await http.get(url);
      _restaurantId = restaurantString;
      print('loaded');
      if (response.statusCode == 200) {
        _restaurant = RestaurantModel.fromJson(response.body);
        return restaurantId;
      } else {
        return '';
      }
    }
    return restaurantId;
  }

  String getStoreLogo() {
    return _restaurant.restaurantImg ??
        "https://www.google.com.br/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png";
  }

  String getStoreName() {
    return _restaurant.restaurantName ?? "";
  }

  String getStoreSubtitle() {
    return _restaurant.restaurantWppNumber ?? "";
  }

  bool isThereMenuStore() {
    return _restaurant.categories == null;
  }

  int getMenuCategoriesLenght() {
    return _restaurant.categories?.length ?? 0;
  }

  String getCategoryName(int categoryIndex) {
    return _restaurant.categories?[categoryIndex].categorieName ?? "";
  }

  String getCategoryId(int categoryIndex) {
    return _restaurant.categories?[categoryIndex].categorieId ?? "";
  }

  int getMenuCategoryItemsLenght(int categoryIndex) {
    return _restaurant.categories?[categoryIndex].categorieItens.length ?? 0;
  }

  String getItemName(int categoryIndex, int itemIndex) {
    return _restaurant
            .categories?[categoryIndex].categorieItens[itemIndex].productName ??
        "";
  }

  String getItemId(int categoryIndex, int itemIndex) {
    return _restaurant
            .categories?[categoryIndex].categorieItens[itemIndex].productId ??
        "";
  }

  String getItemPrice(int categoryIndex, int itemIndex) {
    return _restaurant.categories?[categoryIndex].categorieItens[itemIndex]
            .productPrice ??
        "";
  }

  String getItemDescription(int categoryIndex, int itemIndex) {
    return _restaurant.categories?[categoryIndex].categorieItens[itemIndex]
            .productDescription ??
        "";
  }

  String getItemImage(int categoryIndex, int itemIndex) {
    return _restaurant
            .categories?[categoryIndex].categorieItens[itemIndex].productImg ??
        "";
  }

  CategoryItemModel getRestaurantMenuItem(int categoryIndex, int itemIndex) {
    return _restaurant.categories![categoryIndex].categorieItens[itemIndex];
  }

  CategoryItemModel getRestaurantMenuItemById(
      String categoryId, String itemId) {
    return _restaurant.categories!
        .firstWhere((element) => element.categorieId == categoryId)
        .categorieItens
        .firstWhere((element) => element.productId == itemId);
  }
}
