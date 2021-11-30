import 'dart:async';
import 'package:cardap/shared/models/item_model.dart';
import 'package:cardap/shared/models/order_model.dart';
import 'package:flutter/material.dart';

class CartController extends ChangeNotifier {
  final OrderModel cartOrder = OrderModel(items: []);
  late ItemModel itemSelected;

  Future<void> addItemToCart(BuildContext context) async {
    cartOrder.items!.add(itemSelected); //check OrderModel
    notifyListeners();
    Navigator.pop(context);
  }

  Future<void> selectItem(BuildContext context, ItemModel item) async {
    itemSelected = item;
    notifyListeners();
    Navigator.pushNamed(context, "/menuItemDetails");
  }

  void incrementAdditionalItem(int indexItemBuilder) {
    var c = itemSelected.additionalItems![indexItemBuilder].count;
    if (c != null) {
      c++;
    }
    itemSelected.additionalItems![indexItemBuilder].count = c;
    notifyListeners();
  }

  void decrementAdditionalItem(int indexItemBuilder) {
    var c = itemSelected.additionalItems![indexItemBuilder].count;
    if (c != null && c > 0) {
      c--;
    }
    itemSelected.additionalItems![indexItemBuilder].count = c;
    notifyListeners();
  }

  String getItemAmount() {
    return (itemSelected.price +
            (itemSelected.additionalItems?.fold(
                    0,
                    (previousValue, element) =>
                        previousValue! + element.price * element.count!) ??
                0))
        .toString();
  }

  String getItemDescription() {
    return itemSelected.description;
  }

  void changeItemObservation(String observation) {
    itemSelected.copyWith(observation: observation);
  }

  String getItemName() {
    return itemSelected.name;
  }

  List<String> getItemImages() {
    return itemSelected.images;
  }

  int getgetAdditionalItemsLength() {
    return itemSelected.additionalItems?.length ?? 0;
  }

  String getAdditionalItemCount(int indexItemBuilder) {
    return (itemSelected.additionalItems?[indexItemBuilder].count ?? 0)
        .toString();
  }

  String getAdditionalItemPrice(int indexItemBuilder) {
    return (itemSelected.additionalItems?[indexItemBuilder].price ?? 0)
        .toString();
  }

  String getAdditionalItemName(int indexItemBuilder) {
    return (itemSelected.additionalItems?[indexItemBuilder].name ?? "");
  }
}
