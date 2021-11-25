import 'package:cardap/shared/models/item_model.dart';
import 'package:cardap/shared/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartController {
  ValueNotifier<OrderModel> orderNotifier = ValueNotifier(OrderModel());
  OrderModel get order => orderNotifier.value;
  set order(OrderModel value) => orderNotifier.value = value;

  CartController() {
    getOrder();
  }

  Future<void> getOrder() async {
    try {
      final instance = await SharedPreferences.getInstance();
      final response = instance.getString("order") ?? "";
      order = OrderModel.fromJson(response);
    } catch (e) {
      order = OrderModel();
    }
  }

  Future<void> includeOrderItem(ItemModel item) async {
    if (order.items == null) {
      order.items = [];
    } else {
      order.items!.add(item);
    }

    order.orderAmount = order.items!.fold(
        0,
        (previousValue, element) =>
            previousValue! +
            (element.price +
                (element.additionalItems != null
                    ? element.additionalItems!.fold(
                        0,
                        (previousValue, element) =>
                            element.price * element.count!)
                    : 0)));
    handleOrderStatus;
    saveOrder();
  }

  Future<void> handleOrderStatus() async {
    order.status = "cart";
  }

  Future<void> handleOrderDelivery() async {
    getOrder();
    order.deliveryAmount = 3.0;
    order.deliveryType = "delivery";
    saveOrder();
  }

  Future<void> sendOrder() async {}

  Future<void> saveOrder() async {
    final instance = await SharedPreferences.getInstance();
    await instance.setString("order", order.toJson());
    return;
  }
}
