import 'package:cardap/modules/cart/cart_controller.dart';
import 'package:cardap/modules/restaurant/restaurant_controller.dart';
import 'package:cardap/shared/models/restaurant/category_item_model.dart';
import 'package:cardap/shared/models/store_models/item_model.dart';
import 'package:cardap/shared/themes/app_text_styles.dart';
import 'package:cardap/shared/themes/responsive_padding.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class MenuItemWidget extends StatefulWidget {
  final int categoryIndex;
  final int itemIndex;
  const MenuItemWidget({
    Key? key,
    required this.itemIndex,
    required this.categoryIndex,
  }) : super(key: key);

  @override
  _MenuItemWidgetState createState() => _MenuItemWidgetState();
}

class _MenuItemWidgetState extends State<MenuItemWidget> {
  @override
  Widget build(BuildContext context) {
    final restaurantController = Provider.of<RestaurantController>(context);
    final responsive = ResponsivePadding();

    return Padding(
      padding: responsive.getPadding(context),
      child: Card(
        child: ListTile(
            horizontalTitleGap: 15,
            enableFeedback: true,
            enabled: true,
            onTap: () {
              context.go(
                  '/${restaurantController.restaurantId}/menu/category/${restaurantController.getCategoryId(widget.categoryIndex)}/item/${restaurantController.getItemId(widget.categoryIndex, widget.itemIndex)}');
            },
            leading: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                      image: NetworkImage(restaurantController.getItemImage(
                          widget.categoryIndex, widget.itemIndex)))),
            ),
            title: Text.rich(TextSpan(
              text: restaurantController.getItemName(
                  widget.categoryIndex, widget.itemIndex),
              style: AppTextStyles.smallTitle,
            )),
            subtitle: Text(
              restaurantController.getItemDescription(
                  widget.categoryIndex, widget.itemIndex),
              style: AppTextStyles.description,
            ),
            trailing: Text(
                restaurantController.getItemPrice(
                    widget.categoryIndex, widget.itemIndex),
                style: AppTextStyles.price)),
      ),
    );
  }
}
