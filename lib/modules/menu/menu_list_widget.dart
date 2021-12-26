import 'package:cardap/modules/menu/menu_item_widget.dart';
import 'package:cardap/modules/restaurant/restaurant_controller.dart';

import 'package:cardap/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuListWidget extends StatefulWidget {
  const MenuListWidget({Key? key}) : super(key: key);

  @override
  _MenuListWidgetState createState() => _MenuListWidgetState();
}

class _MenuListWidgetState extends State<MenuListWidget> {
  @override
  Widget build(BuildContext context) {
    final restaurantController = Provider.of<RestaurantController>(context);
    if (restaurantController.isThereMenuStore()) {
      return Expanded(
          child: Text("Cardápio vazio",
              style: AppTextStyles.smallTitle, textAlign: TextAlign.center));
    } else {
      return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: restaurantController.getMenuCategoriesLenght(),
        itemBuilder: (BuildContext context, categoryIndex) {
          return Column(
            children: [
              Text(restaurantController.getCategoryName(categoryIndex),
                  style: AppTextStyles.smallTitle),
              ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: restaurantController
                      .getMenuCategoryItemsLenght(categoryIndex),
                  itemBuilder: (context, itemIndex) {
                    return MenuItemWidget(
                        categoryIndex: categoryIndex, itemIndex: itemIndex);
                  })
            ],
          );
        },
      );
    }
  }
}
