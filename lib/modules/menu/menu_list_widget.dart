import 'package:cardap/modules/menu/menu_item_widget.dart';
import 'package:cardap/shared/models/item_model.dart';
import 'package:cardap/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

class MenuListWidget extends StatefulWidget {
  final List<ItemModel>? menu;
  const MenuListWidget({Key? key, this.menu}) : super(key: key);

  @override
  _MenuListWidgetState createState() => _MenuListWidgetState();
}

class _MenuListWidgetState extends State<MenuListWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget.menu == null) {
      return Expanded(
          child: Text("Cardápio vazio",
              style: AppTextStyles.smallTitle, textAlign: TextAlign.center));
    } else {
      return ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemExtent: 100,
          itemCount: widget.menu!.length,
          itemBuilder: (BuildContext context, index) {
            return MenuItemWidget(itemData: widget.menu![index]);
          });
    }
  }
}
