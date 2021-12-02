import 'dart:async';
import 'package:cardap/shared/models/item_model.dart';
import 'package:cardap/shared/models/order_model.dart';
import 'package:flutter/material.dart';

class CartController extends ChangeNotifier {
  final OrderModel _cartOrder = OrderModel(items: []);
  late ItemModel _itemSelected;

  Future<void> selectItem(BuildContext context, ItemModel item) async {
    _itemSelected = item;
    notifyListeners();
    Navigator.pushNamed(context, "/menuItemDetails");
  }

  //MENU ITEM SELECTED METHODS

  String getItemDescription() {
    return _itemSelected.description;
  }

  String getItemName() {
    return _itemSelected.name;
  }

  List<String> getItemImages() {
    return _itemSelected.images;
  }

  int getAdditionalsItemLength() {
    return _itemSelected.additionalItems?.length ?? 0;
  }

  String getAdditionalItemCount(int indexItemBuilder) {
    return (_itemSelected.additionalItems?[indexItemBuilder].count ?? 0)
        .toString();
  }

  String getAdditionalItemPrice(int indexItemBuilder) {
    return (_itemSelected.additionalItems?[indexItemBuilder].price ?? 0)
        .toString();
  }

  String getAdditionalItemName(int indexItemBuilder) {
    return (_itemSelected.additionalItems?[indexItemBuilder].name ?? "");
  }

  void incrementAdditionalItem(int indexItemBuilder) {
    var c = _itemSelected.additionalItems![indexItemBuilder].count;
    if (c != null) {
      c++;
    }
    _itemSelected.additionalItems![indexItemBuilder].count = c;
    notifyListeners();
  }

  void decrementAdditionalItem(int indexItemBuilder) {
    var c = _itemSelected.additionalItems![indexItemBuilder].count;
    if (c != null && c > 0) {
      c--;
    }
    _itemSelected.additionalItems![indexItemBuilder].count = c;
    notifyListeners();
  }

  void changeItemObservation(String observation) {
    _itemSelected.copyWith(observation: observation);
  }

  String getItemAmount() {
    return (_itemSelected.price +
            (_itemSelected.additionalItems?.fold(
                    0,
                    (previousValue, element) =>
                        previousValue! + element.price * element.count!) ??
                0))
        .toString();
  }

  Future<void> addItemToCart(BuildContext context) async {
    _cartOrder.items!.add(_itemSelected); //check OrderModel
    notifyListeners();
    Navigator.pop(context);
  }

  //ITEMS SAVED IN THE CART - METHODS
  int getSavedItemsLength() {
    return _cartOrder.items?.length ?? 0;
  }

  String getCartItemPhoto(int indexItem) {
    int mainPhoto = _cartOrder.items?[indexItem].mainPhoto ?? 0;
    return _cartOrder.items?[indexItem].images[mainPhoto] ?? "";
  }

  String getCartItemName(int indexItem) {
    return _cartOrder.items?[indexItem].name ?? "";
  }

  String getCartItemAmount(int indexItem) {
    ItemModel item = _cartOrder.items![indexItem];
    return (item.price +
            (item.additionalItems?.fold(
                    0,
                    (previousValue, element) =>
                        previousValue! + element.price * element.count!) ??
                0))
        .toString();
  }

  String getCartItemAdditionalItems(int indexItem) {
    var additionalItems = _cartOrder.items?[indexItem].additionalItems;
    List<String> additionalItemsString = [];
    additionalItems?.forEach((element) {
      if (element.count! > 0) {
        additionalItemsString.add('${element.count} ${element.name}');
      }
    });
    return additionalItemsString.join(' | ');
  }
}
