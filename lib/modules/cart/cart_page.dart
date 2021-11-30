import 'package:cardap/modules/cart/cart_controller.dart';
import 'package:cardap/modules/menu/menu_item_widget.dart';
import 'package:cardap/shared/themes/app_text_styles.dart';
import 'package:cardap/shared/widgets/header/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({
    Key? key,
  }) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cartController = context.watch<CartController>();

    return Column(children: [
      const HeaderWidget(title: "Carrinho"),
      (cartController.cartOrder.items == null)
          ? Text("sem itens no carrinho", style: AppTextStyles.body)
          : SingleChildScrollView(
              child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: cartController.cartOrder.items!.length,
              itemBuilder: (BuildContext context, index) {
                return MenuItemWidget(
                    itemData: cartController.cartOrder.items![index]);
              },
            ))
    ]);
  }
}
