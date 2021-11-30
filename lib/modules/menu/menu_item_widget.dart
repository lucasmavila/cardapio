import 'package:cardap/modules/cart/cart_controller.dart';
import 'package:cardap/shared/models/item_model.dart';
import 'package:cardap/shared/themes/app_text_styles.dart';
import 'package:cardap/shared/themes/responsive_padding.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuItemWidget extends StatefulWidget {
  final ItemModel itemData;
  const MenuItemWidget({
    Key? key,
    required this.itemData,
  }) : super(key: key);

  @override
  _MenuItemWidgetState createState() => _MenuItemWidgetState();
}

class _MenuItemWidgetState extends State<MenuItemWidget> {
  @override
  Widget build(BuildContext context) {
    final cartController = context.read<CartController>();
    final responsive = ResponsivePadding();

    return Padding(
      padding: responsive.getPadding(context),
      child: Card(
        child: ListTile(
            horizontalTitleGap: 15,
            enableFeedback: true,
            enabled: true,
            onTap: () {
              cartController.selectItem(context, widget.itemData);
            },
            leading: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                      image: NetworkImage(
                          widget.itemData.images[widget.itemData.mainPhoto]))),
            ),
            title: Text.rich(TextSpan(
              text: widget.itemData.name,
              style: AppTextStyles.smallTitle,
            )),
            subtitle: Text(
              widget.itemData.description,
              style: AppTextStyles.description,
            ),
            trailing: Text(widget.itemData.price.toString(),
                style: AppTextStyles.price)),
      ),
    );
  }
}
