// ignore_for_file: prefer_const_constructors

import 'package:cardap/modules/menu/menu_item/menu_list_widget.dart';
import 'package:cardap/modules/cart/cart_controller.dart';
import 'package:cardap/shared/models/item_model.dart';
import 'package:cardap/shared/widgets/header/header_widget.dart';
import 'package:flutter/material.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      HeaderWidget(title: "Pedidos"),
    ]);
  }
}
