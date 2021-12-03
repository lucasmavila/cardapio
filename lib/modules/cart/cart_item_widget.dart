import 'package:cardap/modules/cart/cart_controller.dart';
import 'package:cardap/shared/models/item_model.dart';
import 'package:cardap/shared/themes/app_colors.dart';
import 'package:cardap/shared/themes/app_text_styles.dart';
import 'package:cardap/shared/themes/responsive_padding.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItemWidget extends StatefulWidget {
  final int itemSelected;
  const CartItemWidget({
    Key? key,
    required this.itemSelected,
  }) : super(key: key);

  @override
  _CartItemWidgetState createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  @override
  Widget build(BuildContext context) {
    final cartController = context.watch<CartController>();
    final responsive = ResponsivePadding();

    return Padding(
      padding: responsive.getPadding(context),
      child: Card(
        child: ListTile(
            horizontalTitleGap: 15,
            enableFeedback: true,
            enabled: false,
            onTap: () {
              cartController.getCartItemAdditionalItems(widget.itemSelected);
            },
            leading: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                      image: NetworkImage(cartController
                          .getCartItemPhoto(widget.itemSelected)))),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(TextSpan(
                  text: cartController.getCartItemName(widget.itemSelected),
                  style: AppTextStyles.smallTitle,
                )),
                Text(cartController.getCartItemAmount(widget.itemSelected),
                    style: AppTextStyles.price),
              ],
            ),
            subtitle: Text("Adicionais: " +
                cartController.getCartItemAdditionalItems(widget.itemSelected)),
            trailing: IconButton(
              onPressed: () {
                cartController.removeCartItem(widget.itemSelected);
              },
              icon: Icon(
                Icons.remove_circle_outline,
                color: AppColors.primary,
                size: 20,
              ),
            )),
      ),
    );
  }
}
