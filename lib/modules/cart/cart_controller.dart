import 'dart:async';
import 'package:cardap/modules/restaurant/restaurant_controller.dart';
import 'package:cardap/shared/models/restaurant/category_item_model.dart';
import 'package:cardap/shared/models/restaurant/extra_item_model.dart';
import 'package:cardap/shared/models/store_models/item_model.dart';
import 'package:cardap/shared/models/store_models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CartController extends ChangeNotifier {
  final OrderModel _cartOrder = OrderModel(items: []);

  late CategoryItemModel _itemSelected;
  bool get itemNotSelected => _itemSelected.productId.isEmpty;
  List<ExtraItemModel> _itemSelectedExtrasList = [];
  String _itemSelectedObservation = '';

  selectItem(CategoryItemModel item) {
    _itemSelected = item;
  }

  //MENU ITEM SELECTED METHODS

  String getItemSelectedDescription() {
    return _itemSelected.productDescription;
  }

  String getItemSelectedName() {
    return _itemSelected.productName;
  }

  List<String> getItemSelectedImages() {
    return [_itemSelected.productImg];
  }

  int getItemSelectedExtrasListLength() {
    return _itemSelected.productExtraItems?.length ?? 0;
  }

  int getExtraItemSelectedCount(int indexExtraItem) {
    String extraItemId =
        _itemSelected.productExtraItems![indexExtraItem].extraItemId;
    return _itemSelectedExtrasList
        .where((element) => element.extraItemId == extraItemId)
        .length;
  }

  double getExtraItemSelectedPrice(int indexExtraItem) {
    return _itemSelected.productExtraItems?.elementAt(indexExtraItem).price ??
        0;
  }

  String getExtraItemSelectedName(int indexExtraItem) {
    return _itemSelected.productExtraItems?.elementAt(indexExtraItem).name ??
        "";
  }

  void addExtraItemSelected(int indexExtraItem) {
    _itemSelectedExtrasList
        .add(_itemSelected.productExtraItems![indexExtraItem]);
  }

  void removeExtraItemSelected(int indexExtraItem) {
    String extraItemId =
        _itemSelected.productExtraItems![indexExtraItem].extraItemId;

    _itemSelectedExtrasList.remove(_itemSelectedExtrasList
        .firstWhere((element) => element.extraItemId == extraItemId));
  }

  void changeItemSelectedObservation(String observation) {
    _itemSelectedObservation = observation;
  }

  double getItemSelectedTotalAmount() {
    return double.tryParse(_itemSelected.productPrice) ??
        0 +
            _itemSelectedExtrasList.fold(
                0, (previousValue, element) => previousValue + (element.price));
  }

  Future<void> addItemToCart() async {
    _itemSelected.productExtraItems = _itemSelectedExtrasList;
    _cartOrder.items!.add(_itemSelected); //check OrderModel
    notifyListeners();
  }

  //ITEMS SAVED IN THE CART - METHODS
  int getSavedItemsLength() {
    return _cartOrder.items?.length ?? 0;
  }

  String getCartItemPhoto(int indexItem) {
    //int mainPhoto = _cartOrder.items?[indexItem].mainPhoto ?? 0;
    return _cartOrder.items?[indexItem].productImg ?? "";
  }

  String getCartItemName(int indexItem) {
    return _cartOrder.items?[indexItem].productName ?? "";
  }

  double getCartItemAmount(int indexItem) {
    CategoryItemModel item = _cartOrder.items![indexItem];
    return (double.parse(item.productPrice) +
        (item.productExtraItems?.fold(
                0,
                (previousValue, element) =>
                    previousValue ?? 0 + element.price) ??
            0));
  }

  String getCartItemAdditionalItems(int indexItem) {
    var extraItems = _cartOrder.items?[indexItem].productExtraItems ?? [];
    var distinctExtraItems = extraItems.toSet().toList();
    List<String> extraItemsString = [];
    for (final item in distinctExtraItems) {
      extraItemsString.add(extraItems
              .where((element) => element.extraItemId == item.extraItemId)
              .length
              .toString() +
          'x' +
          item.name);
    }
    return extraItemsString.join(' | ');
  }

  void removeCartItem(int indexItem) {
    _cartOrder.items?.removeAt(indexItem);
    notifyListeners();
  }

  String getCartDeliveryTax() {
    _cartOrder.deliveryAmount = 3.0;
    return _cartOrder.deliveryAmount.toString();
  }

  double getCartTotalAmount() {
    List<CategoryItemModel> items = _cartOrder.items ?? [];
    double totalAmount = 5; //DeliveryTax
    for (final item in items) {
      totalAmount += (double.tryParse(item.productPrice) ??
          0 +
              (item.productExtraItems?.fold(0,
                      (previousValue, item) => previousValue! + item.price) ??
                  0));
    }
    return totalAmount;
  }
}
