import 'package:cardap/modules/cart/cart_controller.dart';
import 'package:cardap/modules/cart/cart_item_widget.dart';

import 'package:cardap/shared/models/item_model.dart';
import 'package:cardap/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartListWidget extends StatefulWidget {
  const CartListWidget({Key? key}) : super(key: key);

  @override
  _CartListWidgetState createState() => _CartListWidgetState();
}

class _CartListWidgetState extends State<CartListWidget> {
  @override
  Widget build(BuildContext context) {
    final cartController = context.watch<CartController>();
    if (cartController.getSavedItemsLength() == 0) {
      return Expanded(
          child: Text("Carrinho vazio",
              style: AppTextStyles.smallTitle, textAlign: TextAlign.center));
    } else {
      return ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemExtent: 100,
          itemCount: cartController.getSavedItemsLength(),
          itemBuilder: (BuildContext context, index) {
            return CartItemWidget(itemSelected: index);
          });
    }
  }
}
