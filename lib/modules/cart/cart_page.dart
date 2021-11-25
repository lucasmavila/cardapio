import 'package:cardap/modules/menu/menu_item/menu_list_widget.dart';
import 'package:cardap/modules/cart/cart_controller.dart';

import 'package:cardap/shared/models/order_model.dart';
import 'package:cardap/shared/widgets/header/header_widget.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  final CartController cartController;
  const CartPage({Key? key, required this.cartController}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      HeaderWidget(
          title: "Carrinho (${widget.cartController.order.items?.length})"),
      SingleChildScrollView(
          child: ValueListenableBuilder<OrderModel>(
              valueListenable: widget.cartController.orderNotifier,
              builder: (_, order, __) => MenuListWidget(menu: order.items)))
    ]);
  }
}
